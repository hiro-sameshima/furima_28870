Rails.application.routes.draw do
  devise_for :users
  # get 'items/index'
  root to: "items#index"
  # get 'items/:id' , to: 'items#commission' 非同期処理の箇所
  resources :users, only: [:new, :create,:delete]
  resources :items, only: [:new, :create, :index]
end
