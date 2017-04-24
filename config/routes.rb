Rails.application.routes.draw do
  root to: 'games#index'
  resources :games, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
      resources :reviews, only: [:create]
    end
  end
  devise_for :users
  resources :users, except: [:index, :new, :create]
end
