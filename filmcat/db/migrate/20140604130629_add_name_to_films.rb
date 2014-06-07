class AddNameToFilms < ActiveRecord::Migration
  def change
    add_column :films, :name, :string
  end
end
