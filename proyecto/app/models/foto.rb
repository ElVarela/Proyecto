class Foto < ActiveRecord::Base
	validates_presence_of :titulo, :image
	mount_uploader :image, ImageUploader
end
