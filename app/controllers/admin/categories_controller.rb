class Admin::CategoriesController < PageController
  before_filter :add_breadcrumbs
  # before_filter :authorize, only: [:new, :create, :new_subcategory, :update, :edit]
  def new
   add_breadcrumb "New Category", new_admin_category_path
    @category = params[:id] ? Category.find(params[:id]).children.new : Category.new
    @count = Category.count
  end

  def new_subcategory
   add_breadcrumb "New Subcategory", new_subcategory_admin_categories_path
    @category = params[:id] ? Category.find(params[:id]).children.new : Category.new
  end

  def create
    @category = params[:id] ? Category.find(params[:id]).children.new(params[:category]) : Category.new(params[:category])
    if @category.save
      redirect_to admin_products_path, :notice => "Category created! Woo Hoo!"
    else
      render "new"
    end
  end

  def edit
    add_breadcrumb "Edit Category", edit_admin_category_path
    @category = Category.find(params[:id]) 
  end

  def edit_subcategory
    @category = Category.find(params[:id]) 
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category has been obliterated!"
    redirect_to admin_products_path
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Changed it for ya!"
      redirect_to admin_products_path
    else 
      flash[:alert] = "Category has not been updated."
      render :action => "edit"
    end
  end
  def sort
    params[:category].each_with_index do |id, index|
      Category.update_all({position: index+1}, {id: id})
    end
  end



  def savesort
    neworder = JSON.parse(params[:set])
    prev_item = nil
    neworder.each do |item|
      dbitem = Category.find(item['id'])
      prev_item.nil? ? dbitem.move_to_root : dbitem.move_to_right_of(prev_item)
      sort_children(item, dbitem) unless item['children'].nil?
      prev_item = dbitem
    end
    Category.rebuild!
    render :nothing => true
  end
  
  def sort_children(element,dbitem)
    prevchild = nil
    element['children'].each do |child|
      childitem = Category.find(child['id'])
      prevchild.nil? ? childitem.move_to_child_of(dbitem) : childitem.move_to_right_of(prevchild)
      sort_children(child, childitem) unless child['children'].nil?
      prevchild = childitem
    end
  end

    def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Manage Categories/Products", admin_products_path
  end
end
