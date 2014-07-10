class AddImageToVideo < ActiveRecord::Migration
  def change
  	add_column :videos, :image_file_name, :string
  	add_column :videos, :image_content_type, :string
  	add_column :videos, :image_file_size, :integer
  	add_column :videos, :image_updated_at, :datetime
  end
end
