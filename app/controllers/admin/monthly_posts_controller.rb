class Admin::MonthlyPostsController < PageController
  before_filter :add_breadcrumbs
  # before_filter :authorize, except: [:index]
	def new
    add_breadcrumb "New Post", new_admin_monthly_post_path
    @monthly_post = MonthlyPost.new
	end

  def show

    @monthly_post = MonthlyPost.find(params[:id])
  end

	def create
  	@monthly_post = MonthlyPost.new(params[:monthly_post])
    if @monthly_post.save
      flash[:notice] = 'Posted Successfully!'
      redirect_to [:admin, @monthly_post]
    else
      flash[:alert] = "Not posted successfully."
     render "index"
   end 
  end

  def edit
    add_breadcrumb "Edit Post", edit_admin_monthly_post_path
    @monthly_post = MonthlyPost.find(params[:id]) 
  end
  
  def update
    @monthly_post = MonthlyPost.find(params[:id])
    
    if @monthly_post.update_attributes(params[:monthly_post])
      flash[:notice] = "Post has been updated."
      redirect_to admin_monthly_post_path(@monthly_post)
    else 
      flash[:alert] = "Post has not been updated."
      render :action => "edit"
    end
  end
     
  def index
    add_breadcrumb "All Posts", admin_monthly_posts_path
    @monthly_posts = MonthlyPost.page(params[:page]).newest_first.per_page(5)
  end

   def destroy
    @monthly_post = MonthlyPost.find(params[:id])
    @monthly_post.destroy
    flash[:notice] = "Monthly Post has been deleted!"
    redirect_to admin_monthly_posts_path
  end

  def add_breadcrumbs
    add_breadcrumb "Admin", admin_panel_path
    add_breadcrumb "Manage Page Headers and Descriptions", admin_page_headers_path
    add_breadcrumb "Manage Front Page", admin_monthly_post_path(@latest_monthly_post)
  end
end
