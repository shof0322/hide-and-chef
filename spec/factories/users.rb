FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_read       {"ヤマダ"}
    last_name_read        {"タロウ"}
    birthday              {Faker::Date.between(from: '1980-01-01', to: '2020-01-01')}
  end
end