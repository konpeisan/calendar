FactoryBot.define do
  factory :budget do
    start_time      {Faker::Date.backward}
    price           {Faker::Number.number(5)}
    recovery        {Faker::Number.number(5)}
    total           {recovery-price}
    memo            {Faker::Lorem.sentence}
    store_id        {Faker::Number.number(1)}
    type_name_id    {Faker::Number.number(1)}
    game_hour       {"5"}
    game_minute     {"30"}
  end
end
