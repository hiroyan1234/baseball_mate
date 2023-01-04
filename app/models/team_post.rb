class TeamPost < ApplicationRecord
  
  validates :content, presence: true
  validates :type, presence: true
  validates :area, presence: true
  validates :position, presence: true
  
  
end
