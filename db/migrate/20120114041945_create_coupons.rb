class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :description
      t.date :expiration

      t.timestamps
    end
  end
end
