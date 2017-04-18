class Game < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :platform, presence: true
  validates :release_year, length: { is: 4 }, numericality: true, allow_nil: true

  belongs_to :user
  has_many :reviews
end
