Rails.application.routes.draw do
  resources :picks
  root 'users#home'
  
  devise_for :users, path: :accounts

  resources :teams

end
