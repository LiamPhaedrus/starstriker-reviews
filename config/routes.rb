Rails.application.routes.draw do

  devise_for :users
  resources :users

  root 'games#index'
  resources :games, only: [:index, :show]
end
