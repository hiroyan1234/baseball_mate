class TagCenter < ApplicationRecord
  
  belongs_to :player_post
  belongs_to :team_post
  belongs_to :tag
  
end
