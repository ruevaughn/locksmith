class Admin::CouponsController < PageController
  before_filter :authorize
  before_filter :add_breadcrumbs
  def new
  add_breadcrumb "New Coupon", new_admin_coupon_path
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(params[:coupon])
    if @coupon.save
      redirect_to admin_coupons_path, :notice => "Coupon Created! Woo Hoo!"
    else
      render "new"
    end
  end

  def edit
    add_breadcrumb "Edit Coupon", edit_admin_coupon_path
    @coupon = Coupon.find(params[:id]) 
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    flash[:notice] = "Coupon has been shredded!"
    redirect_to admin_coupons_path
  end

  def update
    @coupon = Coupon.find(params[:id])
    
    if @coupon.update_attributes(params[:coupon])
      flash[:notice] = "Changed the coupon for ya!"
      redirect_to admin_coupons_path
    else 
      flash[:alert] = "Coupon has not been updated."
      render :action => "edit"
    end
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def index
    @coupons = Coupon.all
  end 
  def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Manage Discounts/Coupons", admin_coupons_path
  end
end

