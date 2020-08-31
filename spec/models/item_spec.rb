require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  describe '商品の登録' do
    context "商品が保存される場合" do
      it "全ての項目が正しく存在すれば登録できる" do
        expect(@item).to be_valid
      end

    end
    context "商品が登録されない場合" do
      it "商品名が存在しなければ登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明文が存在しなければ登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリー情報が存在しなければ登録できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "商品状態の情報が存在しなければ登録できない" do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it "配送料負担の情報が存在しなければ登録できない" do
        @item.delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery is not a number")
      end
      it "発送元地域の情報が存在しなければ登録できない" do
        @item.shipping_origin = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping origin is not a number")
      end
      it "発送までの日数の情報が存在しなければ登録できない" do
        @item. arrival_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrival days is not a number")
      end
      it "商品価格の情報が存在しなければ登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300未満では登録できない" do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "価格の範囲が、¥9,999,999以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "販売価格の入力が半角数字以外では登録できない" do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "商品画像が存在していなければ登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end