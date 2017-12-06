Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'products#index'
  devise_for :users

  resources :products do
    resources :reviews
  end

  resource :cart, only: [:show]
  resources :charges

  resources :order_items
  resources :accounts
  resources :orders

end
