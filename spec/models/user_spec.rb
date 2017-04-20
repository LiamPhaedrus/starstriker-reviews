require 'rails_helper'
require "shoulda-matchers"

describe User, type: :model do
  User.create(
    email: 'JoeShmo@gmail.com',
    password: 'something',
    password_confirmation: 'something'
    )
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
