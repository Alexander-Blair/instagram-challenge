class ImageFieldsNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :posts, :image_file_name, false
    change_column_null :posts, :image_content_type, false
    change_column_null :posts, :image_file_size, false
    change_column_null :posts, :image_updated_at, false
  end
end
