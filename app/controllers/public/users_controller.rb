class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @team_post = TeamPost.new
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def withdrawal
    @user = current_user
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会を実行しました"
    redirect_to root_path
  end

  def unsubscribe
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :sex, :is_deleted, :age, :nickname, :introduction, :image, :password, :password_confirmation)
  end
end
