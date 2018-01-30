class UsersController < ApplicationController
  before_action :user_id_params, only: [ :show ]
  layout 'index_layout', only:[:show]
  def index
    @users = User.all
  end

  def show
    @posts = @user.posts.order(created_at: :desc)
  end

  private
    def user_id_params
      @user = User.find(params[:id])
    end
end
