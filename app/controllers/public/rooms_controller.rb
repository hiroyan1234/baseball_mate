class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @current_enter = Enter.create(room_id: @room.id, user_id: current_user.id)
    @another_enter = Enter.create(enter_params)
    redirect_to room_path(@room.id)
  end

  def index
  @users = User.all
  @rooms = current_user.rooms.includes(:messages).order("messages.created_at DESC").page(params[:page])
  @current_enters = current_user.enters
  myRoomIds = []

  @current_enters.each do |enter|
    myRoomIds << enter.room.id
  end

    @keyword = params[:keyword]
    render "index"
  end

  def show
    @room = Room.find(params[:id])
    if Enter.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @enters = @room.enters
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def enter_params
    params.require(:enter).permit(:user_id).merge(room_id: @room.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
