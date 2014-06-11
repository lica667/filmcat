class Video < ActiveRecord::Base
	has_many :comments
	has_many :video_joins
	has_many :users, through: :video_joins
end
