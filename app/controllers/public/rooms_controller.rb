class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @current_enter = Enter.create(user_id: current_user.id, room_id: @room.id)
    @another_enter = Enter.create(params.require(:enter).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  def index
    @enters = Enter.all
  end

  def show
    @room = Room.find(params[:id])
    if Enter.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @enters = @room.enters
    else
      redirect_back(fallback_location: root_path)
    end
  end

end
