class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image
      t.integer :position
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      # Uncomment it to store item level
      t.integer :depth


      t.timestamps
    end
  end
end
