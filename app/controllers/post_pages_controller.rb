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

  def lyric
    @posts = Post.lyric_tag.page(params[:page]).per(PER)
  end
end
