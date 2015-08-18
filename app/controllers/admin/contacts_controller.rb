class Admin::ContactsController < PageController
	before_filter :add_breadcrumbs
  #before_filter :authorize
  def index
    @contacts = Contact.all
  end

  def edit
    add_breadcrumb "Edit Contact Info", edit_admin_contact_path
    @contact = Contact.find(params[:id]) 
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])

      flash[:notice] = "Contact Updated!"
      redirect_to admin_contacts_path
    else 
      flash[:alert] = "Contact has not been updated."
      render :action => "edit"
    end
  end
  def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Contact Info", admin_contacts_path
  end
end
