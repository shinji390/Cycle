class UsersController < ApplicationController
  before_action :user_id_params, only: [ :show, :favorites, :followed, :followers ]
  before_action :authenticate_user!
  PER = 25

  def index
    users = User.all
    @users = post_order(users)
  end

  def show
    posts = @user.posts
    @posts = post_order(posts)
  end

  def favorites
    posts = @user.like_posts
    @posts = post_order(posts)
  end

  def followers
    users = @user.followers
    @users = post_order(users)
  end

  def followed
    users = @user.following
    @users = post_order(users)
  end

  private
    def user_id_params
      @user = User.find(params[:id])
    end

    def post_order(post)
      post.order(created_at: :desc).page(params[:page]).per(PER)
    end
end
