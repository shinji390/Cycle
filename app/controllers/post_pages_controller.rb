class PostPagesController < ApplicationController
  layout 'index_layout'
  def music
    @posts = Post.tagged_with('Melody')
  end

  def video
    @posts = Post.tagged_with('Video')
  end

  def liric
    @posts = Post.tagged_with('Lyric')
  end
end
