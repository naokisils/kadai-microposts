class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :favorites
  has_many :reverses_of_favorites, class_name: "Favorite", foreign_key: 'micropost_id'
  has_many :added, through: :reverses_of_favorites, source: :user
  
  validates :content, presence: true, length: {maximum: 255} 
end
