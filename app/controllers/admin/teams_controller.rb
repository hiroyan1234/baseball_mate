class Admin::TeamsController < ApplicationController
  before_action :admin_signed_in

  def show
    @team = Team.find(params[:id])
  end

  def index
    @teams = Team.all
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to admin_team_path(@team)
    else
      render :edit
    end
  end

  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:user_id, :name, :age, :introduction, :image)
  end

end
