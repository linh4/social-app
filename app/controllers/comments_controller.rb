class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    flash[:success] = "Comment Posted!"
    redirect_to @post
  end

  def destroy
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment Deleted!"
    redirect_to @post
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
