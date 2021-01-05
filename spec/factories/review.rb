FactoryBot.define do
  factory :review do
    clear       {"sample text"}
    dark        {"sample text"}
    association :user
    association :evaluation
  end
end