Rails.application.routes.draw do
  devise_for :users

  resources :beers, only: [:index, :show] do
    post 'add_to_cart', on: :member
  end

  resources :subscribers
  resources :contacts, only: [:new, :create]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create, :show]
  resources :orders do
    post 'update_total_price', on: :collection
  end

  root 'home#index'
  get 'beers', to: 'beers#index'
  get 'about', to: 'about#index'
  get 'contact', to: 'contacts#new'
end
