class Admin::RoomsController < ApplicationController
  before_action :admin_signed_in

  def index
    @rooms = Room.includes(:messages).order("messages.created_at DESC").page(params[:page])
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @enters = @room.enters
  end

  private

  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

end

