Rails.application.routes.draw do
  
  get    'auth'            => 'home#auth'
  
  # Get login token from Knock
  post   'user_token'      => 'user_token#create'
  
  # User actions
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'

  resources :sites, only: [:index, :create, :show, :destroy]
  resources :pages, only: [:index, :create, :show, :destroy]
  resources :insights, only: [:index, :create, :show]
  resources :comments, only: [:index, :create, :show]
  resources :crawls, only: [:index, :create, :show]
  resources :keyterms, only: [:index, :create, :show]

end
