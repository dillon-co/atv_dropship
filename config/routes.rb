Rails.application.routes.draw do

  resources :product_categories
  get "confirm_category" => 'product_categories#confirm_cat', as: :confirm_cat



  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'


  devise_for :admins
  get 'admin_dashboard/orders' => 'admin_dashboard#orders', as: :order_review
  get "admin_dash" => 'admin_dashboard#dash', as: :dash

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

  get '/receipt' => 'orders#order_receipt', as: :receipt

  get 'orders/confirm' => 'orders#confirm', as: :confirm_order

  resources :orders

  resources :charges

  devise_for :users

  resources :users
end
