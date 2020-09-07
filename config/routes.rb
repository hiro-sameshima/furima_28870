Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:new, :create,:delete]
  resources :items,only: [:new, :create,:destroy, :edit, :show, :update,:index]
  resources :shoppings, only:[:index,:create,:new]
end
