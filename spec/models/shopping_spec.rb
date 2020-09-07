require 'rails_helper'

RSpec.describe Shopping, type: :model do
  before do
    # @shopping_address = FactoryBot.build(:shopping_address)
    @shopping = FactoryBot.build(:shopping)
  end

  describe '商品購入テスト' do
    context '購入できる時'  do
      it 'すべて正しく入力すれば保存できる' do
        expect(@shopping).to be_valid
        # expect(@shopping_address).to be_valid
      end
    end
    context '購入できない場合' do
      it '商品のIDがなければ購入できない' do
        @shopping.item_id = ''
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include()
      end
      it '購入者のIDがなければ購入出来ない' do
        @shopping.user_id = ''
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include()
      end
    end
  end
end
