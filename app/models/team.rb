class Team < ApplicationRecord
  has_one_attached :image
  
  belongs_to :user
  has_many :team_post
  
  validates :name, presence: true
  validates :age, presence: true
  validates :introduction, presence: true
  
  enum type: { join: 0, helper: 1, opponent: 2 }
end
