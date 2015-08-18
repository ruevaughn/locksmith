class Review < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :body, :active
	translates :body
	scope :last_three, limit(3)
	scope :active, where(active: true)
end
