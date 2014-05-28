class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.text :description
      t.string :release_date
      t.string :genre
      t.integer :rating

      t.timestamps
    end
  end
end
