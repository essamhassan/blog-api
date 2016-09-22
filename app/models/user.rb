class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	has_many :posts
end
