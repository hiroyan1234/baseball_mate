class Public::PlayerPostsController < ApplicationController
      
  def new
    @player_post = PlayerPost.new
  end
  
  def create
    @player_post = PlayerPost.new(player_post_params)
    if @player_post.save
      flash[:notice] = "投稿完了しました"
      redirect_to player_post_path(@player_post)
    else
      render :new
    end
  end
  
  private
  
  def player_post_params
    params.require(:player_post).permit(:user_id, :content, :post_type, :area, :position)
  end
end
