class Admin::PageController < ApplicationController
	before_filter :authorize
	before_filter :add_admin_breadcrumb
  def panel
  	@contact_info = Contact.first
  end

def add_admin_breadcrumb
	add_breadcrumb "Admin", admin_panel_path
end

end