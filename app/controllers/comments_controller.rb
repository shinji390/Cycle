class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_id_params, only: [ :create, :edit, :update, :destroy ]
  before_action :comment_id_params, only: [ :edit, :update ]

  def create
    @comment = @post.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.js { flash[:success] = 'コメントを投稿しました' }
      else
        format.html { redirect_to post_path(@post) }
        format.js { flash[:danger] = 'エラーがあります' }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js { @comment_id = @comment.id }
    end
  end

  def update
    @comment.update(comment_params)
    respond_to do |format|
      format.html
      format.js { @comment_id = @comment.id }
    end
  end

  def destroy
    comment = Comment.find_by(user_id: current_user.id, post_id: params[:post_id])
    comment.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: posts_path)}
      format.js { flash[:danger] = 'コメントを削除しました' }
    end
  end

private

  def post_id_params
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :text, :video, :url, :melody)
  end

  def comment_id_params
    @comment = Comment.find(params[:id])
  end

end
