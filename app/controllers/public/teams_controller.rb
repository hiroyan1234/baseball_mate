class Public::TeamsController < ApplicationController
  def new
    @team = Team.new
    @user = current_user
  end

  def create
    @team = Team.new(team_params)
    @user = current_user
    if @team.save
      flash[:notice] = "チーム登録完了しました"
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:user_id, :name, :age, :introduction, :image)
  end
end
