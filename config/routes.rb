Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'my_shopping_cart',                          to: 'cart#index'
  patch 'cart/update',                             to: 'cart#update'
  patch 'cart/delete',                             to: 'cart#delete'
  post 'inventory/add_to_cart',             to: 'inventory#add_to_cart'
  devise_for :users, controllers: { registrations: "users/registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
