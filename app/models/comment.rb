class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :text, presence: true, length: { maximum: 1200 }
  validates :url, format: { with: /https:\/\/www.youtube.com\/watch\?v=(.+)/ }, allow_blank: true
  validates :user_id, presence: true
  validates :post_id, presence: true
end