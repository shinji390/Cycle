class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :text
      t.text :melody
      t.text :video
      t.text :url
      t.timestamps
    end
  end
end
