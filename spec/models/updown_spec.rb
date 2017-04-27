require "rails_helper"
require "shoulda-matchers"

describe Updown, type: :model do
  it { expect(:user_id).not_to be(nil) }
  it { should validate_presence_of(:review_id) }
end
