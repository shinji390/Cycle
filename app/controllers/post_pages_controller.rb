class PostPagesController < ApplicationController
  before_action :authenticate_user!
  layout 'index_layout'
  PER = 25

  def music
    @posts = Post.melody_tag.page(params[:page]).per(PER)
  end

  def video
    @posts = Post.video_tag.page(params[:page]).per(PER)
  end

  def liric
    @posts = Post.liric_tag.page(params[:page]).per(PER)
  end
end
