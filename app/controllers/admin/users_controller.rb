class Admin::UsersController < PageController
  # before_filter :authorize
  before_filter :add_breadcrumbs
  def new
   add_breadcrumb "New User", new_admin_user_path
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_users_path, :notice => "User Created"
    else
      render "new"
    end
  end

  def edit
    add_breadcrumb "Edit User", edit_admin_user_path
    @user = User.find(params[:id]) 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User has been deleted."
    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      flash[:notice] = "User has been updated."
      redirect_to @user
    else 
      flash[:alert] = "User has not been updated."
      render :action => "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end 

  def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Manage Users", admin_users_path
  end
end
