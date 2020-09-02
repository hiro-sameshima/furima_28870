class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save  # バリデーションをクリアした時
      redirect_to root_path
    else
      render 'new' # バリデーションに弾かれた時
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def  destroy
    @item = Item.find(params[:id])
    if @item.valid?
    @item.destroy
    redirect_to root_path
  else
    render 'show'
  end
end

def edit
  @item = Item.find(params[:id])
end

def update
  @item = Item.find(params[:id])
    if @item.valid?
      @item.update(item_params)  # バリデーションをクリアした時
      redirect_to root_path
    else
      render 'show' # バリデーションに弾かれた時
    end
end
  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :condition_id, :delivery_id, :shipping_origin_id, :arrival_day_id, :image).merge(user_id: current_user.id)
  end
end
