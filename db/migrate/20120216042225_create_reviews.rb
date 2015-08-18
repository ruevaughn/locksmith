class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :first_name
      t.string :last_name
      t.text :body

      t.timestamps
    end
  end
end
