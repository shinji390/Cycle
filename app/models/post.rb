class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 1200 }
  validates :url, format: { with: /https:\/\/www.youtube.com\/watch\?v=(.+)/ }, allow_blank: true

  belongs_to :user

  # 音楽ファイル
  mount_uploader :melody, MusicUploader
  # 動画ファイル
  mount_uploader :video, VideoUploader

end
