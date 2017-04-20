class Review < ApplicationRecord
  validates :rating, inclusion: { in: 1..5 }
  validates :game_id, presence: true

  belongs_to :game
end
