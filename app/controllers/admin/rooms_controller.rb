class Admin::RoomsController < ApplicationController
  @rooms = Room.order("created_at DESC").page(params[:page])
end
