class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      # redirect_to subs_url
      render :new
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
