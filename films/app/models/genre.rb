class Genre < ActiveRecord::Base
	has_many :genre_videos
	has_many :videos, through: :genre_videos
end
