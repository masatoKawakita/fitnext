# frozen_string_literal: true

class Trainers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   # if params[:trainer] == true
  #   #   Trainer.create()
  #   # end
  #   super
  # end

    # トレーナー登録フォーム
  def new
    @user = User.new
    # @user.build_trainer
    @trainer = @user.build_trainer
  end

  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        redirect_to users_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        redirect_to users_path
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render :new
    end
    user = User.new(configure_account_update_params)
    user.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_account_update_params #:picture_cache画像を保持する :remove_picture画像を削除する パラメーター
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :sex, :email, :tel, :picture, :address,
                                      :infomation, :skype, :encrypted_password, :picture_cache, :remove_picture,
                                      trainer_attributes:[ :license, :experience, :belongs, :user_id]])
  end

  # アカウント編集後、プロフィール画面に移動する
  def after_update_path_for(resource)
    user_path(id: current_user.id)
    # MEMO：root_path DEMODAY後、ユーザー削除をするために設定
  end


  # def after_update_path_for(resource)
  #   user_path(id: current_user.id)
  # end

  # def after_update_path_for(resource)
  #   user_path(current_user)
  # end

  # def after_update_path_for(resource)
  #   user_path(resource)
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    redirect_to users_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    redirect_to users_path
  end
end
