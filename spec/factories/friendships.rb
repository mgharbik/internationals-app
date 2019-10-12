FactoryBot.define do
  factory :friendship do
    association :international_1, factory: :international
    association :international_2, factory: :international
  end
end
