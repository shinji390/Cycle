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
  validate :video_or_youtube

  before_update :tag_update

  # 音楽ファイル
  mount_uploader :melody, MusicUploader
  # 動画ファイル
  mount_uploader :video, VideoUploader

  # お気に入りしているか
  def liked_user?(user_id)
    likes.find_by(user_id: user_id)
  end

  # 動画ファイルvalidate
  def video_or_youtube
    if video? && url?
      errors[:base] << '動画はどちらかひとつでお願いします'
    end
  end

  # 閲覧数トップ
  def self.most_viewed
    order('impressions_count DESC').take(1)
  end

  # いいねトップ
  def self.most_liked
    find(Like.group(:post_id).order('count(post_id) desc').limit(1).pluck(:post_id))
  end

  # viewランキング
  def self.view_ranking
    order('impressions_count DESC').take(5)
  end

  # タグ
  def self.melody_tag
    order(created_at: :desc).tagged_with('Melody')
  end

  def self.video_tag
    order(created_at: :desc).tagged_with('Video')
  end

  def self.lyric_tag
    order(created_at: :desc).tagged_with('Lyric')
  end

  # 編集時タグ変更
  def tag_update
    if self.video? || self.url?
      self.tag_list.add('Video')
    elsif self.melody?
      self.tag_list.add('Melody')
    else
      self.tag_list.add('Lyric')
    end
  end
end
