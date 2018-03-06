class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :post_id_params, only: %i[create destroy]
  respond_to :js

  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    respond_with
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    respond_with
  end

  private

  def post_id_params
    @post = Post.find(params[:post_id])
  end
end
