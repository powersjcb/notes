Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api do
    resources :todos do
      resources :comments
    end

    resources :comments

  end
end
