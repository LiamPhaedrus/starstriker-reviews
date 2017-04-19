require "rails_helper"
require "shoulda-matchers"

describe Game, type: :model do
  Game.create(
    title: "Title", description: "Thing", platform: "NES", release_year: "1994"
  )
  # we didn't use FactoryGirl because of config issues, to deal with later
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:platform) }
  it { should validate_numericality_of(:release_year).only_integer.allow_nil }
  it { should validate_length_of(:release_year).is_equal_to(4) }
end
