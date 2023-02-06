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
end
