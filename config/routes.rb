Rails.application.routes.draw do
  resources :users, only: %i(:index :new :create :edit :destroy)
  resources :user_sessions, only: %i(:new :create :destroy)
end
