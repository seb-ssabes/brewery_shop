Rails.application.routes.draw do
  devise_for :users

  resources :beers, only: [:index, :show] do
    post 'add_to_cart', on: :member
  end

  resources :orders do
    post 'update_total_price', on: :member
  end

  resources :payments, only: [:new, :create] do
    collection do
      get 'success_payment'
    end
  end

  resources :subscribers
  resources :contacts, only: [:new, :create]
  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create, :show]
  resource :fulfillments, only: [:show]

  root 'home#index'
  get 'beers', to: 'beers#index'
  get 'about', to: 'about#index'
  get 'contact', to: 'contacts#new'
end
