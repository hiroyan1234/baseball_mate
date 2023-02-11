class Admin::TeamsController < ApplicationController
  before_action :admin_signed_in

  def show
    @team = Team.find(params[:id])
  end

  def index
    @teams = Team.all
  end
  
  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
  
end
