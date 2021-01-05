FactoryBot.define do
  factory :profile do
    contact               {"000-0000-0000"}
    joining_date          {"2020-12-01"}
    team_id               {"1"}
    association :user
  end
end