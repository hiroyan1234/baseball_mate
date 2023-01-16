class TeamPost < ApplicationRecord

  belongs_to :team
  has_many :favorite_team
  has_many :tag_center

  validates :content, presence: true
  validates :post_type, presence: true
  validates :area, presence: true

  enum post_type: { recruitment: 0, helper: 1, game: 2 }
end
