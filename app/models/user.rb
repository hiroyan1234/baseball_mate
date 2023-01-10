class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image

  has_many :teams
  has_many :favorite_players
  has_many :favorite_teams
  has_many :messages
  has_many :enters
  has_many :player_posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :sex, presence: true
  validates :age, presence: true
  validates :telephone_number, presence: true
  validates :is_deleted, inclusion: {in: [true, false]}

  enum sex: { male: 0, female: 1 }
end
