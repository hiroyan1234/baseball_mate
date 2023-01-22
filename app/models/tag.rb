class Tag < ApplicationRecord

  has_many :tag_teams, dependent: :destroy, foreign_key: 'tag_id'
  has_many :tag_players, dependent: :destroy, foreign_key: 'tag_id'
  has_many :team_posts, through: :tag_teams, dependent: :destroy
  has_many :player_posts, through: :tag_players, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
