class PostPagesController < ApplicationController
  layout 'index_layout'
  PER = 25
  def music
    @posts = Post.tagged_with('Melody').order(created_at: :desc).page(params[:page]).per(PER)
  end

  def video
    @posts = Post.tagged_with('Video').order(created_at: :desc).page(params[:page]).per(PER)
  end

  def liric
    @posts = Post.tagged_with('Lyric').order(created_at: :desc).page(params[:page]).per(PER)
  end
end
