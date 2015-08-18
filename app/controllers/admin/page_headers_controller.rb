class Admin::PageHeadersController < PageController 
  before_filter :add_admin_breadcrumb


  def index
    add_breadcrumb "Manage Page Headers & Descriptions", admin_page_headers_path
    @page_headers = PageHeader.find(:all, order: :page)
    @current_monthly_post = MonthlyPost.last
  end

  def edit
    add_breadcrumb "Manage Page Headers & Descriptions", admin_page_headers_path
    add_breadcrumb "Edit Page", edit_admin_page_header_path
    @page_header = PageHeader.find(params[:id]) 
  end
  
  def update
    @page_header = PageHeader.find(params[:id])
    
    if @page_header.update_attributes(params[:page_header])
      flash[:notice] = "Page header/description has been updated."
      redirect_to admin_page_headers_path
    else 
      flash[:alert] = "Page header/description has not been updated."
      render :action => "edit"
    end
  end
end

def add_admin_breadcrumb
  add_breadcrumb "Admin", admin_panel_path
end