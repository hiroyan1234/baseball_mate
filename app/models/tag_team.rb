class TagTeam < ApplicationRecord
  
  belongs_to :team_post
  belongs_to :tag
end
