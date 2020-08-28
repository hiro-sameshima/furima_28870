FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { 'テスト' }
    first_name            { 'テスト' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birthday { 19_320_202 }
  end
end