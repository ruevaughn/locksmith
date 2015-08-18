class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.text :body
      t.string :title
      t.datetime :published

      t.timestamps
    end
  end
end
