class CreateMonthlyPosts < ActiveRecord::Migration
  def change
    create_table :monthly_posts do |t|
      t.text :body

      t.timestamps
    end
  end
end
