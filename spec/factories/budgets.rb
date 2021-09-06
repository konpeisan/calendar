FactoryBot.define do
  factory :budget do
    start_time      {Faker::Date.backward}
    price           {"20000"}
    recovery        {"10000"}
    total           {recovery.to_i-price.to_i}
    memo            {Faker::Lorem.sentence}
    store_id        {"1"}
    type_name_id    {"1"}
    game_hour       {"5"}
    game_minute     {"30"}
  end
end
