class Public::PlayerPostsController < ApplicationController

  def new
    @player_post = PlayerPost.new
  end

  def create
    @player_post = PlayerPost.new(player_post_params)
    tag_list = params[:player_post][:name].split(nil)
    if @player_post.save
      @player_post.save_tag(tag_list)
      flash[:notice] = "投稿完了しました"
      redirect_to player_post_path(@player_post)
    else
      render :new
    end
  end

  def show
    @player_post = PlayerPost.find(params[:id])
    @player_post_tags = @player_post.tags
    @user = @player_post.user
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

  def destroy
    player_post_id = params[:id].to_i
    user_id = PlayerPost.find(player_post_id).user_id
    unless user_id == current_user.id
      redirect_to player_posts_path
    end
    @player_post = PlayerPost.find(params[:id])
    if @player_post.delete
      redirect_to user_path(current_user.id)
    else
      render :show
    end
  end

  def search
    @player_posts = PlayerPost.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def tag_search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @player_posts = @tag.player_posts.all
  end

  private

  def player_post_params
    params.require(:player_post).permit(:user_id, :content, :post_type, :position, :city, :prefecture, :title, tag_ids: [:name])
  end
end
