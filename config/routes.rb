Rails.application.routes.draw do
  root to: 'games#index'
  resources :games, only: [:index, :show]

  devise_for :users
  resources :users

  namespace :api do
    namespace :v1 do
      resources :games, only: [:index]
    end
  end
end
