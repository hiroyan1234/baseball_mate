class FavoritePlayer < ApplicationRecord
  
  belongs_to :user
  belongs_to :player_post
  
  validates_uniqueness_of :player_post_id, scope: :user_id
end
