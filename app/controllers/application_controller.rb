class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :set_current_user

  # before_action :authenticate_user! #TODO:ログイン・会員登録不可のため

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました"
    user_path(resource)
  end

  # def after_sign_out_path_for(resource)
  #   flash[:alert] = "ログアウトしました"
  #   redirect_to homes_path
  # end

def set_locale
    I18n.locale = I18n.default_locale
end

private
def set_current_user
  User.current_user = current_user
end

def sign_in_required
  redirect_to homes_path unless user_signed_in?
end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
        keys:[
          :name,
          :birthday,
          :sex,
          :tel,
          :picture,
          :address,
          :infomation,
          :skype,
          :user_id,
        trainer_attributes:[
          :id,
          :license,
          :experience,
          :belongs,
          :user_id
          ]])
    devise_parameter_sanitizer.permit(
      :account_update,
        keys:[
          :name,
          :birthday,
          :sex,
          :tel,
          :picture,
          :address,
          :infomation,
          :skype,
          :user_id,
        trainer_attributes:[
          :id,
          :license,
          :experience,
          :belongs,:user_id
          ]])
  end
end
