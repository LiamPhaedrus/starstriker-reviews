require "rails_helper"
require "shoulda-matchers"

describe Review, type: :model do
  Review.create(body: "Hi", rating: 3, game_id: 1)
  # we didn't use FactoryGirl because of config issues, to deal with later
  it { should validate_inclusion_of(:rating).in_range(1..5) }
  it { should validate_presence_of(:game_id) }
end
