class CreateReviewTranslations < ActiveRecord::Migration
  def up
  	Review.create_translation_table!({
  	  body: :text
  	  },{
 		migrate_data: true
  	  })
  end

  def down
  	Review.drop_translation_table! migrate_data: true
  end
end