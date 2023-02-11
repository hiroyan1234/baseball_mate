class Admin::RoomsController < ApplicationController
  before_action :admin_signed_in
  
  def index
    @rooms = Room.order("created_at DESC").page(params[:page])
  end
  
  def show
    @room = Room.find(params[:id])
    @enters = Enter.all
    @enters.each do |enter|
      @user1 = enter.user_id
      @user2
  end
  
  private
  
  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
  
end

