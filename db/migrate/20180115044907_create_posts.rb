class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :title
      t.text :content
      t.text :thumbnail
      t.text :melody
      t.timestamps
    end
    add_index :posts, [ :user_id, :created_at ]
  end
end
