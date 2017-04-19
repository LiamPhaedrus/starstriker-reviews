Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root to: 'user#index'
=======
  root 'games#index'
  resources :games, only: [:index, :show]
>>>>>>> 7c1e9381557f60ed082a6ec2e0428ce83b73292c
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
