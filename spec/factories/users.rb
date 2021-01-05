FactoryBot.define do
  factory :user do
    name                  {"田中太郎"}
    email                 {Faker::Internet.free_email}
    password              {"test1111"}
    password_confirmation {password}
  end
end