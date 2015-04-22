class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
  	@curent_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authorize
  	redirect_to :root, alert: 'You must be logged in to view this page' if current_user.nil?
  end
  helper_method :current_user
end
