class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :description
      t.string :url_img
      t.string :url_video
      t.datetime :release_date

      t.timestamps
    end
  end
end
