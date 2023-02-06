class Admin::TeamPostsController < ApplicationController

  def index
    @team_posts = TeamPost.order("created_at DESC").page(params[:page])
    @tag_list = Tag.all
    if params[:tag_ids]
      @team_posts = [:name]
      params[:tag_ids].each do |key, value|
        @team_posts += Tag.find_by(name: key).tweets if value == "1"
      end
      @team_posts.uniq!
    end
  end
end
