Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'orders', to: 'orders#index'
  resources :orders
  resources :vendors
  root 'orders#index'
end
