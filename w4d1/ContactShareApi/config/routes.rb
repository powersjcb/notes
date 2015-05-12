Rails.application.routes.draw do
  resources :user, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index]
  end
  resources :contact, only: [:create, :destroy, :show, :update]
  resources :contact_share, only: [:create, :destroy]
end
