class Admin::ProductsController < PageController
  # before_filter :authorize
  before_filter :add_breadcrumbs
  def new
    @product = Product.new
    add_breadcrumb "New Product", new_admin_product_path
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_products_path, :notice => "Product Created! Woo Hoo!"
    else
      render "new"
    end
  end

  def edit
    add_breadcrumb "Edit Product", edit_admin_product_path
    @product = Product.find(params[:id]) 
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product has been obliterated!"
    redirect_to admin_products_path
  end

  def update
    @product = Product.find(params[:id])

    @product.insert_at(params[:position].to_i)

    if @product.update_attributes(params[:product])
      
      flash[:notice] = "Changed that for you!"
      redirect_to admin_products_path
    else 
      flash[:alert] = "Product has not been updated."
      render :action => "edit"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @categories = params[:id] ? Category.find(params[:id]).children : Category.categories
    @products = Product.all
    @count = Category.count
  end 

  def move_up
    @product = Product.find(params[:id])
    @product.move_higher
    redirect_to admin_products_path
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower
    redirect_to admin_products_path
  end

  def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Manage Categories & Products", admin_products_path
  end
end
