Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:new, :create,:delete]
  resources :items, only: [:new, :create, :index, :show, :destroy]
end
