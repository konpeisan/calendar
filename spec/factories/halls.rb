FactoryBot.define do
  factory :hall do
    store       {Faker::Name.initials(number: 5)}
    association :user
  end
end
