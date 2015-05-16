Rails.application.routes.draw do
  root 'subs#index'

  resources :users, only: [:new, :create]

  resource :sessions, only: [:new, :create, :destroy]

  resources :posts, except: [:index, :create]

  resources :subs, except: :destroy do
    resources :posts, only: [:new]
  end

  resources :comments, only: [:show, :destroy, :create]
end
