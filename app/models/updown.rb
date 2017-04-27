class Updown < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user_id, presence: { message: "must be logged in" }
  validates :review_id, presence: true
end
