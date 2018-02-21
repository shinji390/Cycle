class Post < ApplicationRecord
  is_impressionable counter_cache: true
  acts_as_taggable
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 3000 }
  validates :url, format: { with: /https:\/\/www.youtube.com\/watch\?v=(.+)/ }, allow_blank: true

  default_scope -> { order(created_at: :desc) }
  # 音楽ファイル
  mount_uploader :melody, MusicUploader
  # 動画ファイル
  mount_uploader :video, VideoUploader

# お気に入りしているか
  def liked_user?(user_id)
    likes.find_by(user_id: user_id)
  end

end
