class UsersController < ApplicationController
  before_action :user_id_params, only: [ :show, :favorites, :followed, :followers ]
  before_action :authenticate_user!
  PER = 25

  def index
    users = User.all
    @users = pagination(users)
  end

  def show
    @posts = pagination(@user.posts)
  end

  def favorites
    @posts = pagination(@user.like_posts)
  end

  def followers
    @users = pagination(@user.followers)
  end

  def followed
    @users = pagination(@user.following)
  end

  private
    def user_id_params
      @user = User.find(params[:id])
    end

    def pagination(post)
      post.page(params[:page]).per(PER)
    end
end
