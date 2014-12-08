class Review < ActiveRecord::Base
	belongs_to :user
  	belongs_to :profil
end
