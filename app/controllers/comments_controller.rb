class CommentsController < ApplicationController
  before_action :post_id_params, only: [ :create, :edit, :update, :destroy ]
  before_action :comment_id_params, only: [ :edit, :update ]

  def create
    @comment = Comment.create(user_id: current_user.id,
                              post_id: params[:post_id],
                              text: params[:text],
                              video: params[:video],
                              url: params[:url],
                              melody: params[:melody])
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
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
      format.js
    end
  end

private

  def post_id_params
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :video, :url, :melody)
  end

  def comment_id_params
    @comment = Comment.find(params[:id])
  end

end
