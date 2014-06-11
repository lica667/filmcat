class CreateVideoJoins < ActiveRecord::Migration
  def change
    create_table :video_joins do |t|
      t.integer :user_id
      t.integer :video_id

      t.timestamps
    end
  end
end
