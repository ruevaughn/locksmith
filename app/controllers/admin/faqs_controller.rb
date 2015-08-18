class Admin::FaqsController < PageController
  # before_filter :authorize
  before_filter :add_breadcrumbs
  def new
    add_breadcrumb "New FAQ", new_admin_faq_path
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      redirect_to admin_faqs_path, :notice => "Frequently asked question created!"
    else
      render "new"
    end
  end

  def edit
    add_breadcrumb "Edit FAQ", edit_admin_faq_path
    @faq = Faq.find(params[:id]) 
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    flash[:notice] = "FAQ has been deleted!"
    redirect_to admin_faqs_path
  end

  def update
    @faq = Faq.find(params[:id])

    if @faq.update_attributes(params[:faq])

      flash[:notice] = "Changed that for ya!"
      redirect_to admin_faqs_path
    else 
      flash[:alert] = "Faq has not been updated."
      render :action => "edit"
    end
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def index
    @faqs = Faq.order("position")
  end 

  def sort
    params[:faq].each_with_index do |id, index|
      Faq.update_all({position: index+1}, {id: id})
    end
  end
  def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Manage FAQ", admin_faqs_path
  end
end
