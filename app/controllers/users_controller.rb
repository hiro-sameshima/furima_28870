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
  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:family_name,:first_name,:family_name_kana,:birthday)
  end
end
