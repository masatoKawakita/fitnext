class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]



  def show
    # @user = User.find(params[:id])
    # unless current_user == @user
    #   redirect_to homes_show_path,  alert: 'URLが正しくありません。'
    # end
  end

  def edit
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
    params.require(:user).permit(:name, :birthday, :sex, :email, :tel, :picture, :address,
                                  :infomation, :skype, :encrypted_password, :picture_cache, :remove_picture)
  end

  def set_user
    @user = User.find(params[:id])
    unless @user == current_user.id
    render homes_show_path,  alert: '違反行為です! 他のユーザーページにはいけません。'
    end
  end
end
