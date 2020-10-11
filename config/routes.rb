Rails.application.routes.draw do
  get 'users/show'
  get 'messages/new'
  devise_for :users
  resources :users, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :orders,only: [:index, :create]
    resources :messages, only: :create
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
      get 'incre_search'
      post 'tag'
    end
    member do
      get 'incre_search'
      post 'tag'
      get 'checked'
    end
  end
end
