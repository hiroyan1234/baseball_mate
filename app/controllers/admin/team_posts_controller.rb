class Admin::TeamPostsController < ApplicationController
  before_action :admin_signed_in

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

  def show
    @team_post = TeamPost.find(params[:id])
  end

  def destroy
    @team_post = TeamPost.find(params[:id])
    if @team_post.destroy
      redirect_to admin_team_posts_path
    else
      render :show
    end
  end

  def search
    @team_posts = TeamPost.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def tag_search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @team_posts = @tag.team_posts.order("created_at DESC").page(params[:page])
  end

  private

  def admin_signed_in
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

end
