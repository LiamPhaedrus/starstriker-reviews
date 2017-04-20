Rails.application.routes.draw do
  root 'games#index'
  resources :games, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:index]
    end
  end

end
