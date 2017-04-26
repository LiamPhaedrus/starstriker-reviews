class Game < ApplicationRecord
  PLATFORMS = [
    ["", ""],
    ["NES", "NES"],
    ["SNES", "SNES"],
    ["Atari", "Atari"],
    ["Arcade", "Arcade"],
    ["Gameboy", "Gameboy"],
    ["Sega Genesis", "Sega Genesis"]
  ]

  validates :title, presence: true
  validates :description, presence: true
  validates :platform,
    presence: true,
    inclusion: { in: PLATFORMS.map { |platform| platform[1] } }
  validates :release_year,
    length: { is: 4 },
    allow_nil: true,
    allow_blank: true,
    numericality: { only_integer: true }

  has_many :reviews
end
