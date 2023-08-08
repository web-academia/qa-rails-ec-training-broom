Rails.application.routes.draw do

  resources :products
  resources :users
  resources :cart_items, :only => [:update, :create, :destroy]
  resources :orders, only: :create
  
  get '/cart', to: 'carts#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end