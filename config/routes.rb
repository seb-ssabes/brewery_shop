Rails.application.routes.draw do
  resources :subscribers
  resources :beers, only: [:index, :show]
  resources :contacts, only: [:new, :create]

  root 'home#index'
  get 'beers', to: 'beers#index'
  get 'about', to: 'about#index'
  get 'contact', to: 'contact#new'
end
