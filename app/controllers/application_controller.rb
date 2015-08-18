class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :get_contact_info
  before_filter :get_logo
  before_filter :get_monthly_post

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  def get_contact_info
    @contact = Contact.last
  end

  def get_logo
    @logo_default = Logo.default
  end

  def get_monthly_post
    @latest_monthly_post = MonthlyPost.last
  end

  def authorize
    redirect_to root_url, alert: "Not authorized" if current_user.nil?
  end

  helper_method :current_user
  helper_method :category_count

end
