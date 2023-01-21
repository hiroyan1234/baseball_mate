class Public::TeamPostsController < ApplicationController
  def new
    @team_post = TeamPost.new(team_post_params)
  end

  def create
    @team_post = TeamPost.new(team_post_params)
    tag_list = params[:team_post][:name].split(nil)
    if @team_post.save
      @team_post.save_tag(tag_list)
      flash[:notice] = "投稿完了しました"
      redirect_to team_posts_path(@team_post.id)
    else
      render :new
    end
  end

  def show
    @team_post = TeamPost.find(params[:id])
    @team_post_tags = @team_post.tags
  end

  def index
    @team_posts = TeamPost.all
    @tag_list = Tag.all
  end

  def destroy
    @team_post = TeamPost.find(params[:id])
    if @team_post.delete
      redirect_to user_path(current_user.id)
    else
      render :show
    end
  end

  private

  def team_post_params
    params.require(:team_post).permit(:team_id, :content, :post_type, :area, :position, tag_ids: [:name])
  end
end

