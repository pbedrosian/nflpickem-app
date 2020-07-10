Rails.application.routes.draw do
  root 'users#home'
  devise_for :users, path: :accounts
end
