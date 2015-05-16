class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_user_id

  private

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def current_user_id
    current_user ? current_user.id : nil
  end

  def logged_in?
    !current_user.nil?
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def could_not_find_error
    flash[:errors] = ["Content does not exist"]
  end
end
