class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user_id
    @post.sub_id = params[:sub_id]

    if @post.save
      redirect_to @post
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.find(params[:sub_id])
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])

    unless @post
      could_not_find_error
      redirect_to subs_url
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.nil?
      could_not_find_error
      redirect_to subs_url
    elsif @post.save  #### FIXXX THISSSS
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy if @post
  end

  def show
    @post = Post.includes(comments: :comments).find(params[:id])
    @comments = @post.comments
  end



  protected

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end
