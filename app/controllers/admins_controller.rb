class AdminsController < ApplicationController
  before_filter :is_admin
    # GET /admin/index
  def index
    @admins = Admin.all
  end
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "New staff account created for #{@admin.name}"
      redirect_to staff_accounts_path
    else 
      flash[:error] = @admin.errors
      render :new
    end
  end
  
  
  def destroy
    @admin = Admin.find(params[:id])
    name = @admin.name
    if @admin.destroy
      flash[:notice] = "Account for #{name} removed."
      redirect_to staff_accounts_path
    else
      flash[:error] = @admin.errors
      render :index
    end
  end
  
  private
  
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
  
end