class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  
  has_many :team
  has_many :favorite_player
  has_many :favorite_team
  has_many :message
  has_many :enter
  has_many :player_post
  
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
