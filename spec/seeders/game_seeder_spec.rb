require "rails_helper"

RSpec.describe GameSeeder do
  it "doesn't create duplicate games on multiple runs" do
    GameSeeder.seed!
    initial_count = Game.count
    GameSeeder.seed!
    expect(Game.count).to eq(initial_count)
  end
end
