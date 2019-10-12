FactoryBot.define do
  factory :international do
    name { Faker::Name.name }
    country  { Faker::Address.country }
  end
end
