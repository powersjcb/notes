class Api::PostsController < ApplicationController
  before_filter :set_post, :only => [:update, :destroy]

  def index
    @posts = Post.all
    render :json => @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render :json => @post
    else
      render :json => @post.errors.full_messages, :status => 422
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      render :json => @post
    else
      render :json => @post.errors.full_messages, :status => 422
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy if @post
    render :json => {}
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
