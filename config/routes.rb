Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items
  resources :orders,only: [:index]do
    member do
      get'index', to: 'orders#index'
      post'create', to: 'orders#create'
    end
  end
end
