class Logo < ActiveRecord::Base
	mount_uploader :image, LogoUploader
	scope :default, where(default: true)
	scope :latest, order('created_at ASC')
	attr_accessible :name, :image, :default

	def falsify_all_others
      Logo.where('id != ?', self.id).each do |item|
    	item.default = false
    	item.save
    end
end
	
end
