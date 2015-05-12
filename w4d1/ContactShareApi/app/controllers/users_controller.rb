class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    render json: @user.destroy
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[id])
    if @user.update_attributes(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

private

  def user_params
    self.params.require(:user).permit(:username)
  end
end
