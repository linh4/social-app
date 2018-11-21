class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = current_user.posts.new
    @followees = current_user.followees.ids << current_user.id
    @posts = Post.where(user_id: @followees).all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    flash[:success] = 'Your post has been published'
    redirect_back fallback_location: root_path
  end

  def show
    @post = Post.find_by_id(params[:id])
    @comment = Comment.new
  end

  def edit
     @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(post_params)
    flash[:success] = 'Post updated!'
    redirect_to @post
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    flash[:success] = 'Post destroyed!'
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
