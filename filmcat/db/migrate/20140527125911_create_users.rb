class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.integer :watched_films
      t.integer :future_films

      t.timestamps
    end
  end
end
