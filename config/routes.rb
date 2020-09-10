Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # resources :users, only: [:new, :create,:delete]
  resources :items,only: [:new, :create,:destroy, :edit, :show, :update,:index] do
    resources :shoppings, only:[:index,:create,:new]
  end
end
