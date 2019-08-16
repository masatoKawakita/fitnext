class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  before_action :set_user, only: [:show, :edit, :update]


  def new
    @user = User.new
  end

  def create
  end

  def update #TODO:アップデートしたら、編集画面へ
  end

  def set_user
    @user = User.find(params[:id])
  end
end
