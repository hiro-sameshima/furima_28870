class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @user = User.new #意味ないかも要確認
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.valid?
      @item.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render "new"    # バリデーションに弾かれた時
    end
  end
# Ajaxからのヒント
  # def commissioned
  #   item = Item.find(params[:id])
  #   if item.commissioned 
  #     post.update(commissioned: false)
  #   else
  #     post.update(commissioned: true)
  #   end

  #   item = Item.find(params[:id])
  #   render json: { item: item }
  # end
  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name,:explanation,:price, :category_id, :condition_id, :delivery_id, :shipping_origin_id, :arrival_days_id,:image).merge(user_id: current_user.id)
  end
  # params.require(:item).permit(:id,:user_id,:name,:explanation, :image, :price, :category_id, :condition_id, :delivery_id, :shipping_origin_id, :arrival_days_id)
  
end

# def change
#   create_table :items do |t|
#     t.string :name,                 null: false
#     t.text :explanation,            null: false
#     t.integer :price,               null: false
#     t.references :user,             foreign_key: true, null: false
#     t.integer :category_id,         null: false
#     t.integer :condition_id,        null: false
#     t.integer :delivery_id,         null: false
#     t.integer :shipping_origin_id,  null: false
#     t.integer :arrival_days,        null: false
#     t.timestamps
#   end
# end