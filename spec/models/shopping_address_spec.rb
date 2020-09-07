require 'rails_helper'

RSpec.describe ShoppingAddress, type: :model do
  before do
    @shopping_address = FactoryBot.build(:shopping_address)
  end

  describe '商品購入' do
    context '購入できる' do
      it 'すべての値が正しく入力されていれば購入できること' do
        # binding.pry
        expect(@shopping_address).to be_valid
      end
      it '建物名は空でも購入できること' do
        @shopping_address.building_name = ''
        expect(@shopping_address).to be_valid
      end
    end
    context '商品が登録されない場合' do
      it 'カード番号が空だと購入出来ない' do
        @shopping_address.token = nil
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入出来ない' do
        @shopping_address.postal_code = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がハイフンをお使用しないと購入出来ない' do
        @shopping_address.postal_code = '1234567'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'cityが空だと購入出来ない' do
        @shopping_address.city = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地(house_number)が空だと購入出来ない' do
        @shopping_address.house_number = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("House number can't be blank")
      end
      it '都道府県(shipping_origin_id)が空だと購入出来ない' do
        @shopping_address.shipping_origin_id = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it '電話番号(phone_number)が空だと購入出来ない' do
        @shopping_address.phone_number = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
