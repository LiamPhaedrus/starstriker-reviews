class Game < ApplicationRecord
  include PgSearch

  PLATFORMS = [
    ["", ""],
    ["NES", "NES"],
    ["SNES", "SNES"],
    ["Atari", "Atari"],
    ["Arcade", "Arcade"],
    ["Gameboy", "Gameboy"],
    ["Sega Genesis", "Sega Genesis"]
  ].freeze

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :platform,
    presence: true,
    inclusion: { in: PLATFORMS.map { |platform| platform[1] } }
  validates :release_year,
    length: { is: 4 },
    allow_nil: true,
    allow_blank: true,
    numericality: { only_integer: true }

  pg_search_scope :search_game_only, against: [:title, :description]
  scope :search, -> (query) { search_game_only(query) if query.present? }

  has_many :reviews
end
