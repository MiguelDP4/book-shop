Rails.application.routes.draw do
  get     'home/index'
  root    'home#index'
  get     'my_shopping_cart',                  to: 'cart#index'
  patch   'cart/update',                       to: 'cart#update'
  post    'cart/purchase',                     to: 'cart#purchase'
  get     'inventory/index',                   to: 'inventory#index'
  get     'inventory/new',                     to: 'inventory#new'
  post    'inventory/create',                  to: 'inventory#create'
  patch   'inventory/update',                  to: 'inventory#update'
  get     'sale/index',                        to: 'sale#index'
  patch   'cart/delete',                       to: 'cart#delete'
  post    'cart/add_to_cart',                  to: 'cart#add_to_cart'
  devise_for :users, controllers: { registrations: "users/registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
