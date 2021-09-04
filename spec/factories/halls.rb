FactoryBot.define do
  factory :hall do
    store       {Faker::Name.initials(number: 5)}
  end
end
