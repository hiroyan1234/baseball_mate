class PlayerPost < ApplicationRecord

  belongs_to :user
  has_many :favorite_players, dependent: :destroy
  has_many :tag_centers, dependent: :destroy

  validates :content, presence: true
  validates :post_type, presence: true
  validates :area, presence: true
  validates :position, presence: true

  enum post_type: { join_team: 0, helper: 1 }
end
