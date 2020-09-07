FactoryBot.define do
  factory :address do
    postal_code { '000-0000' }
    shipping_origin_id { 9 }
    city { '文京区' }
    address { '1-1' }
    phone_number { '09099999999' }
  end
end