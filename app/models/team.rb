class Team < ApplicationRecord
  
  validates :name, presence: true
  validates :age, presence: true
  validates :introduction, presence: true
  
  enum type: { join: 0, helper: 1, opponent: 2 }
end
