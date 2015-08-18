class Admin::ReviewsController < ApplicationController
  before_filter :add_breadcrumbs
  # before_filter :authorize

  def edit
    add_breadcrumb "Edit Review", edit_admin_review_path
    @review = Review.find(params[:id]) 
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(params[:review])

      flash[:notice] = "Changed that for ya!"
      redirect_to admin_reviews_path
    else 
      flash[:alert] = "Review has not been updated."
      render :action => "edit"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def index
    @reviews = Review.all
  end 
  def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Manage Reviews", admin_reviews_path
  end

end
