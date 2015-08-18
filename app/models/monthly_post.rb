class MonthlyPost < ActiveRecord::Base
	translates :body
	attr_accessible :body
	scope :newest_first, :order => 'created_at DESC'
end
