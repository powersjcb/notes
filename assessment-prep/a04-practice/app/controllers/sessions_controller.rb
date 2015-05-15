class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
        user_params[:username],
        user_params[:password])
    if @user
      login_user!(@user)
      redirect_to links_index
    else
      # flash.now[:errors] =
      @user = User.new(user_params[:username])
      render :new
    end
  end

  def destroy
    log_user_out
    redirect_to new_sessions_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
