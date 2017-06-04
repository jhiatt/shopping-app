class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_admin!
    # redirect_to "/login" unless current_user && current_user.admin
    unless current_user && current_user.admin
      redirect_to "/login"
      flash[:error] = "Must be admin to access"
    end
  end

end
