FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 2) }
    explanation           { Faker::Lorem.sentence }
    price                 { '10000' }
    category_id           { '2' }
    condition_id           { '2' }
    delivery_id            { '2' }
    shipping_origin_id { '2' }
    arrival_days_id { '2' }
    association :user
  end
end
