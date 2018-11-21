class StalkZonesController < ApplicationController
  before_action :authenticate_user!

  def show
    if params[:search]
      @users = User.find_all_by(params[:search])
    else
     @users = User.where.not(id: @followees)
     @followees = current_user.followees
    end
  end
end
