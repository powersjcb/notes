class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user_id

    if @comment.save
      redirect_to :back
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment && @comment.destroy
      redirect_to :back
    else
      flash[:errors] = ["Could not delete requested comment"]
      redirect_to subs_url
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to :back
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:commentable_id, :commentable_type, :content)
  end

end
