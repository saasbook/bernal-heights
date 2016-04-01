class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  def authenticate_user!
    super unless $disable_authentication
  end
  
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_dashboard_path
    else
      events_path
    end
  end

# Fix: ??
  def admin_dashboard
  end
end
