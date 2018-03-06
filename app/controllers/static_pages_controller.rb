class StaticPagesController < ApplicationController

  layout 'devise', only: %i[index]
  def index
    @posts = Post.first(3)
  end

  def about
  end

  def thanks
  end
end
