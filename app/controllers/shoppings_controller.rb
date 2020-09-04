class ShoppingsController < ApplicationController

  def index
    @item = Item.find(params[:format])
  end

  def create
    # binding.pry
    # @user = User.find(params[:user_id])
    @item = Item.find(params[:format])
    @shopping = Shopping.new(shopping_params[:format])
    # @shopping = Shopping.new(params[:format])
    @shopping = @item.user_id,@item.id
    # @shopping = Shopping.new(shopping_params)
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
    params.permit(:item_id, :user_id, :token)
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
