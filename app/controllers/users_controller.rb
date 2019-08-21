class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]



  def show
  end

  def edit
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
#TODO:パラメーター正常か確認
  # def user_params
  #   params.require(:user).permit(:name, :birthday, :sex, :email, :tel, :picture, :address,
  #                                 :infomation, :skype, :encrypted_password, :picture_cache,
  #                                 :remove_picture)
  # end

  def user_params  #TODO: trainer_attributes:[:license, :experience, :belongs, :user_id]
    params.require(:user).permit(:name, :birthday, :sex, :email, :tel, :picture, :address,
                                  :infomation, :skype, :encrypted_password, :picture_cache,
                                  :remove_picture)
  end


  def set_user
    @user = User.find(params[:id])
    if current_user != @user
        redirect_to root_path,  alert: '違反行為です! 他のユーザーページにはいけません。'
    end
  end
end
