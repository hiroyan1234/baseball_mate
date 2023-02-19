class Admin::PlayersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
end
