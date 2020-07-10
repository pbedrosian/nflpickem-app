Rails.application.routes.draw do
  resources :teams
  root 'users#home'
  devise_for :users, path: :accounts
end
