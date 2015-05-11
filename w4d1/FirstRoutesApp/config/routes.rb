Rails.application.routes.draw do
  # resources :users
  get    'users(.:format)' => 'users#index', as: 'users'
  post   'users(.:format)' => 'users#create'
  get    'users/new(.:format)' => 'users#new', as: 'new_user'
  get    'users/:id/edit(.:format)' => 'users#edit', as: 'edit_user'
  get    'users/:id(.:format)' => 'users#show',  as: 'user'
  patch  'users/:id(.:format)' => 'users#update'
  put    'users/:id(.:format)' => 'users#update'
  delete 'users/:id(.:format)' => 'users#destroy'


end
