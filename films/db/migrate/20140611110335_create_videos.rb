class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :description
      t.string :url_img
      t.string :url_video
      t.integer :rating
      t.date :release_date

      t.timestamps
    end
  end
end
