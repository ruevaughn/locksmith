class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :position
      t.float :price, precision: 8, scale: 2
      t.text :description
      t.integer :category_id
      t.string :image

      t.timestamps
    end
    add_index :products, :category_id
  end
end
