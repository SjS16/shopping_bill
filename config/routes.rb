Rails.application.routes.draw do
  resources :carts
  resources :items, only: [:create]
  resources :bills
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
