class AddFavoriteToVideoJoin < ActiveRecord::Migration
  def change
    add_column :video_joins, :favorite, :boolean
  end
end
