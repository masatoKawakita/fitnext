class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]



  def show
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
    if current_user != @user
        redirect_to root_path,  alert: '違反行為です! 他のユーザーページにはいけません。'
    end
  end
end
# TODO:fitnext用に編集必須（大元：task2)
# class Trainer::SessionsController < ApplicationController
#   before_action :logging_in , only:[:new, :create]
#   skip_before_action :login_required
#     def new
#     end

#     def create
#       user = User.find_by(email: params[:session][:email].downcase)
#       if user && user.authenticate(params[:session][:password]) && user.trainer_id
#         session[:user_id] = user.id
#         redirect_to user_path(user.id)
#       else
#         flash.now[:danger] = 'ログインに失敗しました'
#         render 'new'
#       end
#     end

#     def destroy
#       session.delete(:user_id)
#       flash[:notice] = 'ログアウトしました'
#       redirect_to new_session_path
#     end

#     private

#     def logging_in
#       redirect_to tasks_path, alert: '既にログインは完了しています。' if logged_in?
#     end
# end