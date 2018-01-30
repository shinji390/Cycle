class RenameThumbnailColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :thumbnail, :video
  end
end
