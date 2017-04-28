require "rails_helper"

RSpec.describe AdminSeeder do
  it "doesn't create duplicate records on multiple runs" do
    AdminSeeder.seed!
    initial_count = User.count
    AdminSeeder.seed!
    expect(User.count).to eq(initial_count)
  end
end
