class Game < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :platform, presence: true
  validates :release_year, length: { is: 4 }, allow_nil: true,
            numericality: { only_integer: true }
  
end
