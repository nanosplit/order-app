Rails.application.routes.draw do
  resources :carts
  resources :products
  resources :venues
  resources :backbars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
