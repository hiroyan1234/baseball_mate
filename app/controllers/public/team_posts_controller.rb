class Public::TeamPostsController < ApplicationController
  before_action :authenticate_user!,except: [:show, :index, :search, :tag_search]

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
    @user = @team_post.team.user
    if user_signed_in?
      @currentUserEnter = Enter.where(user_id: current_user.id)
      @userEnter = Enter.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEnter.each do |cu|
          @userEnter.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @enter = Enter.new
        end
      end
    end
  end

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

  def destroy
    team_post_id = params[:id].to_i
    user_id = TeamPost.find(team_post_id).team.user_id
    unless user_id == current_user.id
      redirect_to team_posts_path
    end
    @team_post = TeamPost.find(params[:id])
    if @team_post.destroy
      redirect_to team_posts_path
    else
      render :show
    end
  end

  def search
    @team_posts = TeamPost.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    render "index"
  end

  def tag_search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @team_posts = @tag.team_posts.order("created_at DESC").page(params[:page])
  end

  private

  def team_post_params
    params.require(:team_post).permit(:team_id, :title, :content, :post_type, :prefecture, :city, :position, tag_ids: [:name])
  end
end

