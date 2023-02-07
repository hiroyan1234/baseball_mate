class Admin::PlayerPostsController < ApplicationController
  def index
    @player_posts = PlayerPost.page(params[:page])
    @tag_list = Tag.all
    if params[:tag_ids]
      @player_posts = [:name]
      params[:tag_ids].each do |key, value|
        @player_posts += Tag.find_by(name: key).tweets if value == "1"
      end
      @player_posts.uniq!
    end
  end
  
  def show
    @player_post = PlayerPost.find(params[:id])
  end
  
  def destroy
    @player_post = PlayerPost.find(params[:id])
    if @player_post.delete
      redirect_to admin_player_posts
    else
      render admin_player_post(@player_post)
    end
  end
end
