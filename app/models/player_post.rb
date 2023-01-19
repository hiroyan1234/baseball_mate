class PlayerPost < ApplicationRecord

  belongs_to :user
  has_many :favorite_player
  has_many :tag_center

  validates :content, presence: true
  validates :post_type, presence: true
  validates :area, presence: true
  validates :position, presence: true

  enum post_type: { join_team: 0, helper: 1 }
end
