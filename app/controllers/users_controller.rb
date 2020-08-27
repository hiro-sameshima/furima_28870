class UsersController < ApplicationController

  def new
  end
  
  def create
   @user =  User.create(user_params)

    if @user.valid?
      @user.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render "new"    # バリデーションに弾かれた時
    end
  end
  
end
