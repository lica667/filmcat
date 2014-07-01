class CreatePremiereVideos < ActiveRecord::Migration
  def change
    create_table :premiere_videos do |t|
      t.integer :user_id
      t.integer :video_id

      t.timestamps
    end
  end
end
