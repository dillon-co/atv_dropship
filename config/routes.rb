Rails.application.routes.draw do
  resources :products
  resources :vehicles
  root to: 'visitors#index'

  devise_for :users
  
  resources :users
end
