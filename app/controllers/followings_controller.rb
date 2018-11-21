class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.followees << @user
    redirect_back fallback_location: root_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @following = Following.find_by(follower_id: current_user.id, followee_id: @user.id)
    @following.destroy
    redirect_back fallback_location: root_path
  end

end
