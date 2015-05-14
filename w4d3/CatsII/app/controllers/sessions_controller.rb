class SessionsController < ApplicationController
  before_action :redirect_logged_in, except: :destroy

  def new
    @user = User.new
    #fail
    render :new
  end

  def create
    @user = User.find_by_credentials(
      login_params[:user_name],
      login_params[:password])

    if @user

      login_user!(@user)
      redirect_to cats_url
    else
      #flash.now[:notices] =
      @user = User.new(login_params)
      render :new
    end
  end

  def destroy
    UserSession.find_by(session_token: session[:session_token]).delete
    session[:session_token] = nil

    redirect_to new_session_url
  end




  def login_params
    params.require(:user).permit(:user_name,:password)
  end

  private

  def redirect_logged_in
    if current_user
      redirect_to cats_url
    end
  end


end
