class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.string :facebook
      t.string :twitter
      t.string :google_reviews

      t.timestamps
    end
  end
end
