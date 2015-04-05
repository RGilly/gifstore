class Image < ActiveRecord::Base

	mount_uploader :file, ImageUploader
	belongs_to :user

	validates :file, presence: true
	validates :title, presence: true
	validates :categories, presence: true

end
