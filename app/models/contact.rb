class Contact < ActiveRecord::Base
	attr_accessible :phone, :email, :facebook, :twitter, :google_reviews
end
