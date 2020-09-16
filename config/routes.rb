Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :messages, only: [:create]
    member do
      get 'purchase', to: 'items#purchase'
      post 'purchase', to: 'items#buy'
    end
    collection do
      get 'search'
    end
  end
end
