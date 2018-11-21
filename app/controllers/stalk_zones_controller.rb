class StalkZonesController < ApplicationController
  before_action :authenticate_user!

  def show
    if params[:search]
      @users = User.find_all_by(params[:search])
    else
     @users = User.all
    end
  end
end
