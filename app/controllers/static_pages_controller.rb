class StaticPagesController < ApplicationController

  layout 'devise', only:[:index]
  def index
  end

  def about
  end
end
