class AddActiveToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :active, :boolean
  end
end
