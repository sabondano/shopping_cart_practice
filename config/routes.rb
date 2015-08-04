Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  post "/cart_items", to: "cart_items#create"
  get "/cart", to: "cart_items#index"
end
