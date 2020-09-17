Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    get 'items/id', to: 'items#checked'
    resources :messages, only: [:create]
    member do
      get 'purchase', to: 'items#purchase'
      post 'purchase', to: 'items#buy'
    end
    collection do
      post 'search', to: 'items#search'
    end
  end
end
