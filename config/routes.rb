Rails.application.routes.draw do

  root 'users#home'
  
  devise_for :users, path: :accounts

  resources :users, only: [:show, :index] do
    resources :picks
  end

  # esources :teams

  # resources :games

  get '/profile', to: 'users#show', as:'profile'

  get '/league', to: 'users#index'

  get '/schedule', to: 'games#schedule'

end
