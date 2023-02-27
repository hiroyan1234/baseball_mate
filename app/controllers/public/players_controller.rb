class Public::PlayersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @team_post = TeamPost.new
    if user_signed_in?
      @currentUserEnter = Enter.where(user_id: current_user.id)
      @userEnter = Enter.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEnter.each do |cu|
          @userEnter.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @enter = Enter.new
        end
      end
    end
  end

  def edit
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to player_path(current_user)
    end
    @user = User.find(params[:id])
  end

  def update
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to player_path(current_user)
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "選手情報を更新しました"
      redirect_to player_path(@user)
    else
      render :edit
    end
  end

    private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :sex, :is_deleted, :age, :nickname, :introduction, :image, :password, :password_confirmation, :is_deleted)
  end

end
