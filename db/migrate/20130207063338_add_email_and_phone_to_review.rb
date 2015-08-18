class AddEmailAndPhoneToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :email, :string
    add_column :reviews, :phone, :string
  end
end
