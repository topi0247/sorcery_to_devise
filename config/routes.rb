Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i(index new create edit destroy)
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
