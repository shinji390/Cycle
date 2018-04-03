class AddUpdateToCommens < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :updated, :boolean, default: false
  end
end
