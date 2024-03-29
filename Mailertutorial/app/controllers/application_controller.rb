class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to new_login_path unless logged_in?
  end
end
