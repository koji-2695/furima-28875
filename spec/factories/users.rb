FactoryBot.define do
  factory :user do
    name              {Faker::Internet.username}
    email                 {Faker::Internet.email}
    password              {"000aaa"}
    password_confirmation {"000aaa"}
    first_name        {"こうじ"}
    first_name_kana     {"コウジ"}
    family_name      {"ふじた"}
    family_name_kana      {"フジタ"}
    birthday          {"1988-09-10"}
  end
end