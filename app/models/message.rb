class Message < ApplicationRecord

  belongs_to :user
  belongs_to :room

  validates :content, presence: true

  def self.search(keyword)
    where(["content like? OR title like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def room_has_current_user_id
    @rooms = Room.all
    @room = @rooms.each do |room|
      @enters = room.enter.all
      
    end
  end
end
