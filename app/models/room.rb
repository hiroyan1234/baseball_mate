class Room < ApplicationRecord

  has_many :messages, dependent: :destroy
  has_many :enters, dependent: :destroy
  has_many :users, through: :enters

  def self.search(keyword)
    where(["messages.content like?", "%#{keyword}%"])
  end
end
