FactoryBot.define do
  factory :shopping do
    user_id { '2' }
    item_id       { '2' }
    id            { '2' }

    association :item
    association :user
  end
end
