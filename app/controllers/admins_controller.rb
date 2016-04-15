class AdminsController < ApplicationController
  before_filter :is_admin
    # GET /admin/index
  def index
    @admins = Admin.all
  end
  
  def edit
    @admin = current_admin
  end
  
  def new
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "#{@admin.name} was successfully created."
      redirect_to admin_accounts_path
    else 
      flash[:error] = @admin.errors
      render :new
    end
  end
  
  def update
    @admin = Admin.find(admin_params[:id])
    if admin_params[:password]
      updated = @admin.update_with_password(admin_params)
    else
      updated = @admin.update_attributes(admin_params)
    end
    
    if updated
      flash[:notice] = "#{@admin.name} was successfully created."
      redirect_to admin_accounts_path
    else 
      flash[:error] = @admin.errors
      render :new
    end
  end
  
  def destroy
  end
  
  private
  
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
  
end