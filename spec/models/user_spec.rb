require 'rails_helper'
require "shoulda-matchers"

describe User, type: :model do
  User.create(
    email: 'JoeShmo@gmail.com',
    password: 'something',
    password_confirmation: 'something',
    username: 'JoeShmo'
    )

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
end
