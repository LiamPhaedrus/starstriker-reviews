Rails.application.routes.draw do
  root to: 'games#index'
  resources :games, only: [:index, :show, :create, :new, :destroy]
  resources :reviews, only: [:index, :destroy]


  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
      resources :reviews, only: [:create, :update]
    end
  end
  devise_for :users
  resources :users, except: [:new, :create]
end
