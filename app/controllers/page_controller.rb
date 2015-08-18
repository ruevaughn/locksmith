class PageController < ApplicationController
  def home
    @monthly_post = MonthlyPost.last
    @page_header = PageHeader.home.first
    @reviews = Review.active
    @services = Category.services.first
    @products = Category.products.first
    @review = Review.new
    @discounts = Coupon.all
    @message = Message.new
    # @categories = Category.roots
  end

  def services
    @categories = Category.roots
    @page_header = PageHeader.services.first
  end 

  def faq
    @faqs = Faq.all
    @page_header = PageHeader.faqs.first
  end
  
  def discounts
    @discounts = Coupon.all
    @page_header = PageHeader.discounts.first
  end 
  
  def contact_us
    @contacts = Contact.all
    @page_header = PageHeader.contact_us.first
  end
end