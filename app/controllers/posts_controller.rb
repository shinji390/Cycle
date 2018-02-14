class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_id_params, only: [ :show, :edit, :update, :destroy ]

  layout 'index_layout', only: [ :index, :show ]

  PER = 9

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(PER)
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
  end

  def edit
  end

  def update
    @post.update(post_params)
    flash[:notice] = '編集しました'
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    flash[:alert] = '削除しました'
    redirect_back(fallback_location: root_path)
  end

private

  def post_params
    params.require(:post).permit(:title, :content, :video, :melody, :url)
  end

  def post_id_params
    @post = Post.find(params[:id])
  end

  def tag_add(post)
    if post.melody.present?
      post.tag_list.add('Melody')
    elsif post.video.present?
      post.tag_list.add('Video')
    elsif post.url.present?
      post.tag_list.add('Youtube')
    else
      post.tag_list.add('Lyric')
    end
  end

end
