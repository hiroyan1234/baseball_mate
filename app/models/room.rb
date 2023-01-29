class Room < ApplicationRecord

  has_many :messages, dependent: :destroy
  has_many :enters, dependent: :destroy

end
