class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_id_params, only: %i[show edit update destroy]
  layout 'index_layout', only: %i[index show]
  impressionist actions: %i[show]

  def index
    @posts = Post.page(params[:page]).per(24)
    @most_viewed = Post.most_viewed
    @most_liked = Post.most_liked
    @ranking = Post.view_ranking
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    tag_add(@post)
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    impressionist(@post)
  end

  def edit
  end

  def update
    @post.tag_list.clear
    @post = current_user.posts.build(post_params)
    tag_add(@post)
    if @post.update(post_params)
      flash[:notice] = '編集しました'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = '削除しました'
    destroy_redirect
  end

private

  def post_params
    params.require(:post).permit(:title, :content, :video, :melody,
                                :url, :remove_melody, :remove_video)
  end

  def post_id_params
    @post = Post.find(params[:id])
  end

  def tag_add(post)
    if post.video? || post.url?
      post.tag_list.add('Video')
    elsif post.melody?
      post.tag_list.add('Melody')
    else
      post.tag_list.add('Lyric')
    end
  end


end
