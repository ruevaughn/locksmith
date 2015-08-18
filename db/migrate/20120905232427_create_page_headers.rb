class CreatePageHeaders < ActiveRecord::Migration
  def up
    create_table :page_headers do |t|
      t.string :title
      t.text :description
      t.integer :page

      t.timestamps
    end
    PageHeader.create_translation_table! title: :string, description: :text
  end

  def down
  	drop_table :page_headers
  	Pageheader.drop_translation_table!
  end
end
