class ShoppingsController < ApplicationController
  before_action :item_choice, only: [:index, :create]
  before_action :authenticate_user!
  def index
      @shopping = ShoppingAddress.new
  end

  def create
    @shopping = ShoppingAddress.new(shopping_params)
    if @shopping.valid?
      pay_item
      @shopping.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def shopping_params
    params.permit(:token, :postal_code, :shipping_origin_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id).merge(item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],                      # カードトークン
      currency: 'jpy'                             # 通貨の種類(日本円)
    )
  end

  def item_choice
     @item = Item.find(params[:format])
  end
end
