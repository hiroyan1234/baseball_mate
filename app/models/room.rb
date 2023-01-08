class Room < ApplicationRecord
  
  has_many :message
  has_many :enter
  
end
