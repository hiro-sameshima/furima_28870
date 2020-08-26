class UsersController < ApplicationController

  def new
  end
  
  def create
    User.create(user_params)
  end



end
