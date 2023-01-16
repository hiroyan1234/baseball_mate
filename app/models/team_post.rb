class TeamPost < ApplicationRecord

  belongs_to :team
  has_many :favorite_teams, dependent: :destroy
  has_many :tag_centers

  validates :content, presence: true
  validates :post_type, presence: true
  validates :area, presence: true

  enum post_type: { recruitment: 0, helper: 1, game: 2 }
end
