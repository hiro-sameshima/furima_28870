class ShoppingsController < ApplicationController

  def index
    @item = Item.find(params[:format])
  end

  def create
    binding.pry
    @shopping = Shopping.new(price: shopping_params[:price])
    if @shopping.valid?
      pay_item
      @shopping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def shopping_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_64079f3008257dea990e1f58"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: shopping_params[:price],  # 商品の値段
      card: shopping_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
