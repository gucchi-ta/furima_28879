Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :orders,only: [:index, :create]
    collection do
      get 'search'
      get 'incre_search'
      post 'tag'
    end
    member do
      get 'incre_search'
      post 'tag'
    end
  end
end
