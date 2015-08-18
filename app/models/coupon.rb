class Coupon < ActiveRecord::Base
	attr_accessible :name, :description, :expiration
end
