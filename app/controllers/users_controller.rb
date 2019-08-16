class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to homes_show_path,  alert: 'URLが正しくありません。'
    end
  end

end
