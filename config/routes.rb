Rails.application.routes.draw do

  resources :products
  resources :users
  resources :orders
  get '/login', to: 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end