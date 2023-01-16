class FavoriteTeam < ApplicationRecord
  
  belongs_to :user
  belongs_to :team_post
  
  validates_uniqueness_of :team_post_id, scope: :user_id
end
