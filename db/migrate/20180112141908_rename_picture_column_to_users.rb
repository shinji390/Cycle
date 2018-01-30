class RenamePictureColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :picture, :avatar
  end
end
