class PostPagesController < ApplicationController
  before_action :authenticate_user!
  layout 'index_layout'
  PER = 25

  def music
    @posts = Post.tagged_with('Melody').page(params[:page]).per(PER)
  end

  def video
    @posts = Post.tagged_with('Video').page(params[:page]).per(PER)
  end

  def liric
    @posts = Post.tagged_with('Lyric').page(params[:page]).per(PER)
  end
end
