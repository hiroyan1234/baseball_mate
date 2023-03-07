class Admin::UsersController < ApplicationController
  before_action :admin_signed_in

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :telephone_number, :sex, :is_deleted, :age, :nickname, :introduction, :image, :password, :password_confirmation, :is_deleted)
  end

end
