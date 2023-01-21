class TagPlayer < ApplicationRecord
  
  belongs_to :player_post
  belongs_to :tag
end
