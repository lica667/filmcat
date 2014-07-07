class RemoveGenreFromVideos < ActiveRecord::Migration
  def change
  	remove_column(:videos, :genre)
  end
end
