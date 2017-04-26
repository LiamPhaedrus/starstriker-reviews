FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "bob#{n}" }
    sequence(:email) { |n| "bob#{n}@example.com" }
    password "123456"
    admin false
  end
  factory :admin, class: User do
    sequence(:username) { |n| "bob#{n}" }
    sequence(:email) { |n| "bob#{n}@example.com" }
    password "123456"
    admin true
  end
end
