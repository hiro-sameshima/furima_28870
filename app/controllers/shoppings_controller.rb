class ShoppingsController < ApplicationController

  def index
    @item = Item.find(params[:format])
  end

  def create
  end

end
