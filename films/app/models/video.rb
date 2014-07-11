class Video < ActiveRecord::Base
	has_many :comments
	has_many :likes

	has_many :video_joins
	has_many :users, through: :video_joins
	
	has_many :genre_videos
	has_many :genres, through: :genre_videos

	default_scope { order(:name) }
	accepts_nested_attributes_for :genres, :allow_destroy => true

	has_attached_file :image
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
