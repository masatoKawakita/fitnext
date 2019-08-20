class TrainersController < ApplicationController #TODO
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
    if @user.id == current_user.id  && trainer.user_id
      if @user.update(trainer_params)
        redirect_to user_path(current_user.id && trainer.user_id), notice: "情報を更新しました"
      else
        render "new", alert: "更新に失敗しました"
      end
    end
  end

  def destroy
  end

private

  def trainer_params
    params.require(:user).permit(:name, :birthday, :sex, :email, :tel, :picture, :address,
                                  :infomation, :skype, :encrypted_password, :picture_cache,
                                  :remove_picture, :license, :experience, :belongs,
                                  :license, :experience, :belongs)
  end

  def set_trainer
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path,  alert: '違反行為です! 他のユーザーページにはいけません。'
    end
  end
end
