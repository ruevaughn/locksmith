class CreateMonthlyPostTranslations < ActiveRecord::Migration
  def up
  	MonthlyPost.create_translation_table!({
  	  body: :text
  	  },{
 		migrate_data: true
  	  })
  end

  def down
  	MonthlyPost.drop_translation_table! migrate_data: true
  end
end
