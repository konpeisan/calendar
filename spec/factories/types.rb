FactoryBot.define do
  factory :type do
    type_name      {Faker::Name.initials(number: 5)}
    pachi_slot     {"パチンコ"}
    kind           {"ミドル"}
  end
end
