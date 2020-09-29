FactoryBot.define do
  factory :chef do
    name          {Faker::Name.initials(number: 2)}
    explanation   {Faker::Food.description}
    commitment    {Faker::Food.dish}
    city          {Faker::Address.city}
    address       {Faker::Address.street_name}
    prefecture_id {Faker::Number.between(from: 2, to: 10)}
    category_id   {Faker::Number.between(from: 2, to: 5)}
    phone_num     {Faker::Number.number(digits: 11)}
  end
end
