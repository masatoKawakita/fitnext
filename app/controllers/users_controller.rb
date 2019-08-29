class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :destroy] #MEMO: :show はユーザーがトレーナー詳細を確認するために外している
before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create] #MEMO:ログイン後 トレーナー閲覧のみ可能
  def index
    @trainer_ids = Trainer.pluck(:user_id)
    @users = User.where(id: @trainer_ids)

    # @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @trainer = Trainer.find_by(user_id: @user.id)
  end

  def edit
    # if current_user != @user
    #   redirect_to users_path
    # end
    unless @user.trainer.blank?
      @trainer = @user.trainer
    end
  end

  def update
    if @user.id == current_user.id
      if @user.update(user_params)
        redirect_to user_path(current_user.id), notice: "情報を更新しました"
      else
        render "new", alert: "更新に失敗しました"
      end
    end
  end

  def destroy
  end

private

  def user_params
    params.require(:user).permit(
      :name,
      :birthday,
      :sex,
      :email,
      :tel,
      :picture,
      :address,
      :infomation,
      :skype,
      :encrypted_password,
      :picture_cache,
      :remove_picture,
      trainer_attributes: [
        :id,
        :license,
        :experience,
        :belongs,
        :user_id
      ]
    )
  end


  def set_user #TODO:user_idが付与されているuser(trainer)はユーザーページへいける
    @user = User.find(params[:id])
    if current_user != @user
        redirect_to root_path,  alert: '違反行為です! 他のユーザーページにはいけません。'
    end
  end
end

