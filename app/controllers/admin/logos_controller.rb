class Admin::LogosController < PageController
  before_filter :add_breadcrumbs
  before_filter :authorize
  def new
    add_breadcrumb "New Logo", new_admin_logo_path
    @logo = Logo.new
  end

  def create
    @logo = Logo.new(params[:logo])
    if @logo.save
      @logo.falsify_all_others
      redirect_to admin_logos_path, :notice => "Logo has been uploaded successfully"
    else
      render "new"
    end
  end

  def edit
    @logo = Logo.find(params[:id]) 
    add_breadcrumb @logo.name, admin_logo_path
    add_breadcrumb "Edit Logo", edit_admin_logo_path
    
  end

  def destroy
    @logo = Logo.find(params[:id])
    @logo.destroy
    flash[:notice] = "Logo has been obliterated!"
    redirect_to admin_logos_path
  end

  def update
    @logo = Logo.find(params[:id])
    
    if @logo.update_attributes(params[:logo])
      @logo.falsify_all_others
      flash[:notice] = "Logo has been changed successfully!"
      redirect_to admin_logos_path
    else 
      flash[:alert] = "Logo has not been updated."
      render :action => "edit"
    end
  end

  def show
    @logo = Logo.find(params[:id])
    add_breadcrumb @logo.name, admin_logo_path
  end

  def index
    @logos = Logo.latest.all
  end 
  def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Manage Logos", admin_logos_path
  end
end
