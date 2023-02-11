class Public::FavoritePlayersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @favorite_player = current_user.favorite_players.create(player_post_id: params[:player_post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @player_post = PlayerPost.find(params[:player_post_id])
    @favorite_player = current_user.favorite_players.find_by(player_post_id: @player_post.id)
    @favorite_player.destroy
    redirect_back(fallback_location: root_path)
  end

  def index
    @favorite_players = current_user.favorite_players
  end
  
  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
