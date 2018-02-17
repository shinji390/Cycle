class AddCounterCacheToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :impressions_count, :integer, default: 0
  end
end
