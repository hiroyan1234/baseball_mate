class FavoriteTeam < ApplicationRecord
  
  belongs_to :user
  belongs_to :team_post
end
