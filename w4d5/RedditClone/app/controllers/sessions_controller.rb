class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      user_params[:username],
      user_params[:password])
    if @user && @user.save
      login_user!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["The username and password you entered did not match our records. Please double-check and try again."]
      @user = User.new(username: user_params[:username])
      render :new
    end
  end

  def new
    @user = User.new
  end

  def destroy
    logout_user! if logged_in?
    redirect_to new_sessions_url

    #render :destroy -> cant find it -> raises
  end

  protected

  def user_params
    params.require(:session).permit(:username, :password)
  end

end
