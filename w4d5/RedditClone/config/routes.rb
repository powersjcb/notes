Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resource :sessions, only: [:new, :create, :destroy]

  resources :posts, except: [:index, :new, :create] do
    resources :comments, only: [:new, :create]
  end

  resources :subs, except: :destroy do
    resource :post, only: [:new, :create]
  end

  resources :comments, only: [:show, :destroy] do
    resources :comments, only: [:new, :create]
  end
end
