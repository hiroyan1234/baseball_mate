class PlayerPost < ApplicationRecord
  
  validates :content, presence: true
  validates :type, presence: true
  validates :area, presence: true
  validates :position, presence: true
  
  enum type: { join: 0, helper: 1 }
end
