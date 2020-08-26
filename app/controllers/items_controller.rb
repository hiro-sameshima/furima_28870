class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
  end
  def move_to_index

  private

    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
