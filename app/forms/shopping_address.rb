class ShoppingAddress

  include ActiveModel::Model
  attr_accessor  :user_id, :item_id, :postal_code, :city, :house_number, :building_name,:shipping_origin_id, :phone_number ,:shopping_id ,:token

  with_options presence: true do
    validates :token, presence: { message: 'can\'t be blank' }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number
  end
  
  validates :shipping_origin_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    shopping = Shopping.create!(user_id: user_id, item_id: item_id)
    
    address = Address.create(
      postal_code: postal_code, 
      city: city,
      house_number: house_number,
      building_name: building_name, 
      shipping_origin_id: shipping_origin_id,
      phone_number: phone_number,
      shopping_id: shopping.id
    )
  end
end