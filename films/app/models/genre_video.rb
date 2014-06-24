class GenreVideo < ActiveRecord::Base
	belongs_to :video
	belongs_to :genre
end
