class Image < ActiveRecord::Base
	belongs_to :user

	validates :file, presence: true

end
