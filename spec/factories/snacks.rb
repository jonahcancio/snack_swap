FactoryBot.define do
  factory :snack do
    name { Faker::Food.unique.dish }
    description { Faker::Food.description }
  end
end