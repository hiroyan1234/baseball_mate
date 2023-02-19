class Public::TeamsController < ApplicationController
  before_action :authenticate_user!,except: [:show]

  def new
    @team = Team.new
    @user = current_user
  end

  def show
    @team = Team.find(params[:id])
    @team_post = TeamPost.new
  end

  def edit
    team_id = params[:id].to_i
    user_id = Team.find(team_id).user_id
    unless user_id == current_user.id
      redirect_to player_path(current_user)
    end
    @team = Team.find(params[:id])
  end

  def update
    team_id = params[:id].to_i
    user_id = Team.find(team_id).user_id
    unless user_id == current_user.id
      redirect_to player_path(current_user)
    end
    @team = Team.find(params[:id])
    @user = current_user
    if @team.update(team_params)
      redirect_to player_path(@user)
    else
      render :edit
    end
  end

  def create
    @team = Team.new(team_params)
    @user = current_user
    if @team.save
      flash[:notice] = "チーム登録完了しました"
      redirect_to player_path(@user)
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:user_id, :name, :age, :introduction, :image)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
