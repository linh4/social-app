class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts.order('created_at DESC')
    @post = current_user.posts.new
    @current_user_does_not_follow = !current_user_follows?
    @current_user_follows = current_user_follows?
  end

  def followees
    @user = User.find_by_id(params[:id])
    @user.followees
  end
  def followers
    @user = User.find_by_id(params[:id])
    @user.followers
  end
end
