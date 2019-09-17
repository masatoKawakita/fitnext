class UsersController < ApplicationController
# protect_from_forgery
before_action :set_user, only: [:edit, :update, :destroy] #MEMO: :show はユーザーがトレーナー詳細を確認するために外している
before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create] #MEMO:ログイン後 トレーナー閲覧のみ可能
  def index
    @trainer_ids = Trainer.pluck(:user_id)
    @users = User.where(id: @trainer_ids)
    @keyword = User.ransack(params[:q]) #:q(query)は検索窓に入力された値をパラメータで取得
    @users = @keyword.result
    if params[:q] != nil
      params[:q]['name_cont_any'] = params[:q]['name_cont_any'].split(/[\p{blank}\s]+/)
      @keyword = User.ransack(params[:q])
      @users = @keyword.result
    else
      @keyword = User.ransack(params[:q])
      @users = @keyword.result #検索の結果を受け取る。
    end
    if params[:tag_name]
      @users = @users.tagged_with("#{params[:tag_name]}")
    end
    # @users = User.all
  end

  def show
    if Trainer.find_by(user_id: current_user.id).present?
      me_trainer = current_user
      @user = User.find_by(id: params[:id])
      @trainer = Trainer.find_by(user_id: @user.id)
      if @user == me_trainer
        # 自分がトレーナであり、ユーザーshowが自分のページであったら閲覧可能
      else
        redirect_to :root, notice: "ユーザー（トレーナーを除く）のみが閲覧できます"
      end
    else
      @user = User.find_by(id: params[:id])
      @trainer = Trainer.find_by(user_id: @user.id)
    end
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
    # if @user.id == current_user.id
      if @user.update(user_params)
        redirect_to user_path(current_user.id), notice: "情報を更新しました"
      else
        render "edit", alert: "更新に失敗しました"
      end
  end

  def destroy
      @user.destroy
      redirect_to root_path, notice:"アカウントを削除しました。ご利用頂きまして、ありがとうございました。"
  end
      # set_user.destroy
    # redirect_to user_path

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
      :tag_list,
      trainer_attributes: [
        :id,
        :license,
        :experience,
        :belongs,
        :user_id,
      #   :tag_list,
      # # ↑トレーナータグ
      ]
    )
  end

  def set_user
    @user = User.find(params[:id])
    if current_user != @user
        redirect_to root_path,  alert: '違反行為です! 他のユーザーページにはいけません。'
    end
  end
end

