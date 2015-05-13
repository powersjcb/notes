class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = ["User successfully created!"]

      redirect_to user_url(@user)
    else
      flash.now[:error] = @user.errors.full_messages

      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    self.params.require(:user).permit(:username, :password)
  end

end
