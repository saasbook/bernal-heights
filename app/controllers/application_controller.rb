class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  
  # def authenticate_user!
  #   super unless $disable_authentication
  # end
  
  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_dashboard_path
    else
      events_path
    end
  end
  
  def is_admin
    if !admin_signed_in?
      flash[:notice] = "You must be an administrator to see this page"
      redirect_to new_admin_session_path
    end
  end
end
