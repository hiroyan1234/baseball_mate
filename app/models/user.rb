class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image

  has_many :teams
  has_many :favorite_players, dependent: :destroy
  has_many :favorite_teams, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :enters, dependent: :destroy
  has_many :player_posts
  has_many :rooms, through: :enters, dependent: :destroy

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

  def already_team_favorited?(team_post)
    self.favorite_teams.exists?(team_post_id: team_post.id)
  end

  def already_player_favorited?(player_post)
    self.favorite_players.exists?(player_post_id: player_post.id)
  end
end
