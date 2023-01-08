class TeamPost < ApplicationRecord
  
  belongs_to :team
  has_many :favorite_team
  has_many :tag_center
  
  validates :content, presence: true
  validates :type, presence: true
  validates :area, presence: true
  validates :position, presence: true
  
  
end
