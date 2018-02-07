class UsersController < ApplicationController
  before_action :user_id_params, only: [ :show ]
  before_action :authenticate_user!
  layout 'index_layout', only:[:show]
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

  private
    def user_id_params
      @user = User.find(params[:id])
    end
end
