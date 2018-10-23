Rails.application.routes.draw do

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  # resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  get 'cart/show', as: :cart

  resources :dad_jokes
  resources :inventory_types
  resources :sub_categories
  resources :categories
  resources :inventories
  resources :vehicles
  root to: 'visitors#index'

  get '/about' => 'pages#about', as: :about

  get 'orders/confirm' => 'orders#confirm', as: :confirm_order

  resources :orders

  resources :charges

  devise_for :users

  resources :users
end
