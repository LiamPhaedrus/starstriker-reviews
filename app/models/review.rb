class Review < ApplicationRecord
  validates :body, presence: true
  validates :rating, inclusion: { in: 1..5, message: "must be between 1 - 5" }

  belongs_to :user
  belongs_to :game
end
