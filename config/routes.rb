Rails.application.routes.draw do
  resources :subscribers

  root 'home#index'
  get 'beers', to: 'beers#index'
  get 'merch', to: 'merch#index'
  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'
end
