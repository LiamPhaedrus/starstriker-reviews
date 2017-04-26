FactoryGirl.define do
  factory :game do
    sequence(:title) { |n| "Game#{n}" }
    sequence(:description) { |n| "{n} is a description" }
    platform "NES"
    release_year "1990"
  end
end
