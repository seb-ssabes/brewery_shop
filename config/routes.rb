Rails.application.routes.draw do
  resources :subscribers
  resources :beers, only: [:index, :show]
  resources :contacts, only: [:new, :create]
  resources :products, only: [:index, :show]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]


  root 'home#index'
  get 'beers', to: 'beers#index'
  get 'about', to: 'about#index'
  get 'contact', to: 'contacts#new'
end
