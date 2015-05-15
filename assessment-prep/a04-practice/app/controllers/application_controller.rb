class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?
  helper_method :current_user


  def logged_in?
    !current_user.nil?
  end

  def current_user
    @user = User.find_by(session_token: session[:session_token])
  end

  def log_user_out
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def login_user!(user)
    session[:session_token] = user.session_token
  end

end
