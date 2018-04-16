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

  # Page crawl actions

  post   '/pages/:id/crawl' => 'pages#crawl'

  resources :sites, only: [:index, :create, :show, :destroy]
  resources :pages, only: [:index, :create, :show, :destroy]
  resources :insights, only: [:index, :create, :show, :update]
  resources :comments, only: [:index, :create, :show, :update]

end
