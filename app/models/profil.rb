class Profil < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :reviews
	belongs_to :user
	belongs_to :job


end
