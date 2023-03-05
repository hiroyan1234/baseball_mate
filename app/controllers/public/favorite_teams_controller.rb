class Public::FavoriteTeamsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @favorite_team = current_user.favorite_teams.create(team_post_id: params[:team_post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @team_post = TeamPost.find(params[:team_post_id])
    @favorite_team = current_user.favorite_teams.find_by(team_post_id: @team_post.id)
    @favorite_team.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def index
    @favorite_teams = current_user.favorite_teams.order("created_at DESC").page(params[:page])
  end
  
  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
