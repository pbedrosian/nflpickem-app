Rails.application.routes.draw do

  root 'users#home'
  
  devise_for :users, path: :accounts

  resources :users, only: :show, path: :profile do
    resources :picks, except: :patch
  end

  patch '/users/:user_id/picks/:id', to: 'picks#show', as: 'picks'

  get '/league', to: 'users#index'

  get '/schedule', to: 'games#schedule'

end
