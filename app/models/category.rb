class Category < ActiveRecord::Base
  acts_as_nested_set
  acts_as_list :scope => :parent_id
  attr_accessible :name, :parent_id, :position, :image
  has_many :products

  mount_uploader :image, CategoryUploader

	scope :position, order("position asc")
	scope :categories, where("depth IS NULL")
	scope :subcategories, where("parent_id IS NOT NULL")
	scope :with_depth_below, lambda { |level|
  	  where(self.arel_table[:depth].lt(level))
    }
  scope :services, where("name = 'Services'")
  scope :products, where("name = 'Products'")
  
end
