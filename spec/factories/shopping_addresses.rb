FactoryBot.define do
  factory :shopping_address do
    postal_code           { '123-4567' }
    city                  { '東京都' }
    house_number          { '新宿区1-1' }
    building_name         { '新宿ビル' }
    shipping_origin_id    { '1' }
    phone_number          { '09011112222' }
    user_id               { '1' }
    item_id               { '1' }
    token                 { 'token' }
  end
end
