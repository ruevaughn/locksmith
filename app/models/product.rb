class Product < ActiveRecord::Base
  belongs_to :category
  acts_as_list :scope => :category
  scope :position, order("position asc")
  attr_accessible :name, :position, :price, :description, :category_id, :image
  mount_uploader :image, ProductUploader
end
