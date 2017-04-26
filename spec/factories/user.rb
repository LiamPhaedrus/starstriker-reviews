FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "bob#{n}" }
    sequence(:email) { |n| "bob#{n}@example.com" }
    password "123456"
  end
end
