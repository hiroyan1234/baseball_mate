class PlayerPost < ApplicationRecord

  belongs_to :user
  has_many :favorite_players, dependent: :destroy
  has_many :tag_players, dependent: :destroy
  has_many :tags, through: :tag_players


  validates :content, presence: true
  validates :post_type, presence: true
  validates :prefecture, presence: true
  validates :position, presence: true

  enum post_type: { join_team: 0, helper: 1 }

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end

  def self.search(keyword)
    where(["content like? OR title like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
