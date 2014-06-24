class CreateGenreVideos < ActiveRecord::Migration
  def change
    create_table :genre_videos do |t|
      t.integer :genre_id
      t.integer :video_id

      t.timestamps
    end
  end
end
