class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :id_film
      t.integer :id_user
      t.text :text

      t.timestamps
    end
  end
end
