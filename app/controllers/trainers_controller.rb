class TrainersController < ApplicationController #TODO
#   before_action :set_trainer, only: [:show, :edit, :update, :destroy]

#   def new
#     @user = User.new
#     @user.build_trainer
#   end

#   def create
#     @user = User.new(user_params)
#     @user.save!
#     redirect_to root_path(@user) #TODO:viewを作成次第、トレーナーマイページへ
#   rescue
#     render action: 'new'
#   end

#   def show
#   end

#   def edit
#   end

#   def update
#     if @user.id == current_user.id  && user.trainer_id
#       if @user.update(user_params)
#         redirect_to user_path(current_user.id && user.trainer_id), notice: "情報を更新しました"
#       else
#         render "new", alert: "更新に失敗しました"
#       end
#     end
#   end

#   def destroy
#   end

# private

#   def user_params
#     params.require(:user).permit(:name, :birthday, :sex, :email, :tel, :picture, :address,
#                                   :infomation, :skype, :encrypted_password, :picture_cache,
#                                   :remove_picture, :license, :experience, :belongs,
#                                   trainer_attributes: [:id, :trainer])
#   end

#   def set_trainer
#     @user = User.find(params[:id])
#     if current_user != @user
#       redirect_to root_path,  alert: '違反行為です! 他のユーザーページにはいけません。'
#     end
#   end
end
