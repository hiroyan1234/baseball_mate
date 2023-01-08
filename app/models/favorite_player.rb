class FavoritePlayer < ApplicationRecord
  
  belongs_to :user
  belongs_to :player_post
  
end
