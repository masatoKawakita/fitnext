class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to homes_show_path,  alert: 'URLが正しくありません。'
    end
  end

  def update
    if @user.id == current_user.id
      if @user.update(user_params)
        redirect_to user_path(@user.id), success: "情報を更新しました"
      else
        render "new", danger: "更新に失敗しました"
      end
    end
  end
end
