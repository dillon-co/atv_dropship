Rails.application.routes.draw do

  resources :inventory_types
  resources :sub_categories
  resources :categories
  resources :inventories
  resources :products
  resources :vehicles
  root to: 'visitors#index'

  get '/about' => 'pages#about', as: :about

  resources :orders

  resources :charges

  devise_for :users

  resources :users
end
