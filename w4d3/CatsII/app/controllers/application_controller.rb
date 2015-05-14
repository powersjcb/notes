class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def login_user!(user)
    session[:session_token] = UserSession.create_new_token(user)
  end

  def current_user
    @session = UserSession.find_by_session_token(session[:session_token])
    if @session
      @session.user
    else
      nil
    end
  end
end
