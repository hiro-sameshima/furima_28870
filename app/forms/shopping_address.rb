class ShoppingAddress

  include ActiveModel::Model
  attr_accessor  :user_id, :item_id, :postal_code, :city, :house_number, :building_name,:shopping_origin_id, :phone_number ,:shopping_id

  
end