class Admin::TeamsController < ApplicationController
  
  def show
    @team = Team.find(params[:id])
  end
  
  def index
    @teams = Team.all
  end
end
