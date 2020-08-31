class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery
  belongs_to_active_hash :shipping_origin
  # belongs_to_active_hash :arrival_days
  
  has_one :shopping
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  

  with_options presence: true do
    validates :name 
    validates :image
    validates :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end
  
  with_options numericality: { other_than: 0 } do    
        validates :category_id
        validates :condition_id 
        validates :delivery_id
        validates :shipping_origin_id
        validates :arrival_days_id
  end
end