FactoryGirl.define do
  factory :game do
    sequence(:title) { |n| "Game #{n}" }
    description { "Some kind of a description" }
    platform "NES"
    release_year "1990"
  end
end
