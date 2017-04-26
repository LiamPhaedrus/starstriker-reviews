require "rails_helper"
require "shoulda-matchers"

describe Updown, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:review_id) }
end
