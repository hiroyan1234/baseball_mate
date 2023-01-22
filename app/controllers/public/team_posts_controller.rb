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
    if params[:tag_ids]
      @team_posts = [:name]
      params[:tag_ids].each do |key, value|
        @team_posts += Tag.find_by(name: key).tweets if value == "1"
      end
      @team_posts.uniq!
    end
  end

  def destroy
    @team_post = TeamPost.find(params[:id])
    if @team_post.delete
      redirect_to user_path(current_user.id)
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
    @team_posts = @tag.team_posts.all
  end

  private

  def team_post_params
    params.require(:team_post).permit(:team_id, :title, :content, :post_type, :prefecture, :city, :position, tag_ids: [:name])
  end
end

