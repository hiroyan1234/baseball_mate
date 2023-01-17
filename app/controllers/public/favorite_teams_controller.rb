class Public::FavoriteTeamsController < ApplicationController
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
end
