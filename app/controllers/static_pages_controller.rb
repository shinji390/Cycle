class StaticPagesController < ApplicationController

  layout 'devise', only:[:index]
  def index
    @posts = Post.first(3)
  end

  def about
  end

  def thanks
  end
end
