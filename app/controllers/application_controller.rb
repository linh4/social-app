class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:log_in, keys: [:name, :email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :bio, :location])
  end

  def current_user_follows?
    @user = User.find(params[:id])
    current_user.followees.include?(@user)
  end
end
