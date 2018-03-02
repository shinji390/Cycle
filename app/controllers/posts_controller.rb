class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_id_params, only: [ :show, :edit, :update, :destroy ]

  layout 'index_layout', only: [ :index, :show ]

  impressionist actions: [:show]
  PER = 24

  def index
    @posts = Post.page(params[:page]).per(PER)
    @most_viewed = Post.order('impressions_count DESC').take(1)
    @most_liked = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(1).pluck(:post_id))
    @ranking = Post.order('impressions_count DESC').take(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_add(@post)
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    impressionist(@post)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = '編集しました'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = '削除しました'
    redirect_to posts_path
  end

private

  def post_params
    params.require(:post).permit(:title, :content, :video, :melody, :url, :remove_melody, :remove_video)
  end

  def post_id_params
    @post = Post.find(params[:id])
  end

  def tag_add(post)
    if post.video.present? || post.url.present?
      post.tag_list.add('Video')
    elsif post.melody.present?
      post.tag_list.add('Melody')
    else
      post.tag_list.add('Lyric')
    end
  end

end
