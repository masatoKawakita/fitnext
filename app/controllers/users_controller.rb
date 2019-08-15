class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def new
  end

  def create
  end

  def update #TODO:アップデートしたら、編集画面へ
  end

end
