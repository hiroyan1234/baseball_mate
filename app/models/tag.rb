class Tag < ApplicationRecord

  has_many :tag_centers, dependent: :destroy, foreign_key: 'tag_id'
  has_many :team_ppsts, through: :tag_centers, dependent: :destroy
  has_many :player_ppsts, through: :tag_centers, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
