class Api::TodosController < ApplicationController
  def show
    @todo = Todo.find(params[:id])
    @comments = @todo.comments
    render "show"
  end

  def index
    @todos = Todo.all
    render json: @todos
  end
end
