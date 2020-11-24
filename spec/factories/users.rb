FactoryBot.define do
  factory :user do
    name              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {"000000"}
    first_name        {"test"}
    first_name_kana     {"test"}
    family_name      {"test"}
    family_name_kana      {"test"}
    birthday          {"test"}
  end
end