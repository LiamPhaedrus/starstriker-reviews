Rails.application.routes.draw do
  devise_for :users
  root to: 'user#index'

  root 'games#index'
  resources :games, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
