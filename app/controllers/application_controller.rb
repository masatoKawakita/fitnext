class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_show_path
  end

private
  def sign_in_required
    redirect_to homes_path unless user_signed_in?
  end

protected
  def configure_permitted_parameters #TODO:デフォルトのemail password以外を記述か？！
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:sex])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:tel])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:picture])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:infomation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:skype])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
    devise_parameter_sanitizer.permit(:account_update, keys: [:tel])
    devise_parameter_sanitizer.permit(:account_update, keys: [:picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:infomation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:skype])
  end
end
