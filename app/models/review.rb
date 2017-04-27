class Review < ApplicationRecord
  validates :rating, inclusion: { in: 1..5 }
  validates :game_id, presence: true
  validates :user_id, presence: true

  belongs_to :game
  belongs_to :user
  has_many :updowns
end
