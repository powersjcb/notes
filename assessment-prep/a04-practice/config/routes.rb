Links::Application.routes.draw do
  resources :users, only: [:create, :new]
  resource :sessions, only: [:new, :create, :destroy]
end
