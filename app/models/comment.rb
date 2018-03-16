class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :text, presence: true, length: { maximum: 1200 }
  validates :url, format: { with: /https:\/\/www.youtube.com\/watch\?v=(.+)/ }, allow_blank: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validate :video_or_youtube

  # 音楽ファイル
  mount_uploader :melody, MusicUploader
  # 動画ファイル
  mount_uploader :video, VideoUploader

  # 動画ファイルvalidate
  def video_or_youtube
    if video.present? && url.present?
      errors[:base] << '動画はどちらかひとつでお願いします'
    end
  end

end
