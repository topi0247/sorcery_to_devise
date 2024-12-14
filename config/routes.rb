Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i(index new create edit destroy)
  resources :user_sessions, only: %i(new create destroy)
end
