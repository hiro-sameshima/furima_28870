class Item < ApplicationRecord
  belongs_to :user
  has_one :shopping
  has_one_attached :image
  # belongs_to_active_hash :category_id,:condition_id, :delivery_id,:shipping_origin_id,:arrival_days_id,
end
