class Api::TodoCommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end
end
