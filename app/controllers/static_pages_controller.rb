class StaticPagesController < ApplicationController

  layout 'devise', only: %i[index]
  def index
    @posts = Post.order(created_at: :desc).first(3)
  end

  def about
  end

  def thanks
  end
end
