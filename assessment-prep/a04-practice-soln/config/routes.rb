Links::Application.routes.draw do
  root to: "sessions#new"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :links
  resources :comments, only: [:create, :destroy]
end
