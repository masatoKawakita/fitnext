class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def new
  end

  def create
  end


end
