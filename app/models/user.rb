class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	has_many :posts
	acts_as_voter
end
