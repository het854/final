class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user  
  before_action :auth

  def auth
    unless current_user
      redirect_to new_session_url
    end
  end

  def current_user
    User.find_by(id: session["user_id"])
  end

end
