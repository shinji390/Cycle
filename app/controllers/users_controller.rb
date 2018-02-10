class UsersController < ApplicationController
  before_action :user_id_params, only: [ :show, :favorites, :followed, :followers ]
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def favorites
  end

  def followers
  end

  def followed
  end

  private
    def user_id_params
      @user = User.find(params[:id])
    end
end
