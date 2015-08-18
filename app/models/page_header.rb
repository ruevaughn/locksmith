class PageHeader < ActiveRecord::Base
	translates :title, :description
	scope :home, where("page = 1")
	scope :services, where("page = 2")
	scope :faqs, where("page = 3")
	scope :discounts, where("page = 4")
	scope :contact_us, where("page = 5")
end
