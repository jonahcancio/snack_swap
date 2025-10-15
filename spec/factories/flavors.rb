FactoryBot.define do
  factory :flavor do
    name { Faker::Food.spice }
    color { Faker::Color.hex_color }
  end
end