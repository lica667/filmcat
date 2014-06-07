class CreateFilmJoins < ActiveRecord::Migration
  def change
    create_table :film_joins do |t|
    	t.belongs_to :user
    	t.belongs_to :film
      t.timestamps
    end
  end
end
