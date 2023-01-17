class Public::TeamPostsController < ApplicationController
  def new
    @team_post = TeamPost.new(team_post_params)
  end

  def create
    @team_post = TeamPost.new(team_post_params)
    if @team_post.save
      flash[:notice] = "投稿完了しました"
      redirect_to team_posts_path(@team_post.id)
    else
      render :new
    end
  end

  def show
    @team_post = TeamPost.find(params[:id])
  end

  def index
    @team_posts = TeamPost.all
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
  params.require(:team_post).permit(:team_id, :content, :post_type, :area, :position)
  end
end

