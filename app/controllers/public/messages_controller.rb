class Public::MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Enter.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to room_path(@message.room_id)
  end
  
  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
