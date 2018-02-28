class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy
  has_many :comment_posts, through: :comments, source: :post

  has_many :active_relationships, foreign_key: 'follower_id',
            class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id',
            class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :messages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 150 }, on: :update

  # アバター
  mount_uploader :avatar, AvatarUploader

  # 指定のユーザーをフォロー
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  # フォローしているかどうかを確認
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  # フォロー解除
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # TwitterLogin
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        name: auth.info.name,
        username: auth.info.nickname
      )
    end
    user
  end

# Edit/Password不要
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end


private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
