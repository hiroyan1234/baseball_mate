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
  end


  def index
    @player_posts = PlayerPost.all
    @tag_list = Tag.all
    if params[:tag_ids]
      @player_posts = [:name]
      params[:tag_ids].each do |key, value|
        @player_posts += Tag.find_by(name: key).tweets if value == "1"
      end
      @player_posts.uniq!
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
