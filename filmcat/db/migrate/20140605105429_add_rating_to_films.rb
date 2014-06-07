class AddRatingToFilms < ActiveRecord::Migration
  def change
    add_column :films, :rating, :integer
  end
end
