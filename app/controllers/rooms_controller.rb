class RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find_by(id: room_params[:user_id])
    redirect_back(fallback_location: root_path) unless @user
    @room = Room.DM_find_or_create_by_current_users(@user)
    set_instance_variables
    redirect_to room_path(@room)
  end

  def show
    set_instance_variables
  end

  private
  def room_params
    params.require(:room).permit(:user_id)
  end

  def set_instance_variables
    @room ||= Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    @entries = @room.entries
  end
end
