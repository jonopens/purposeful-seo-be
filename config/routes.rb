Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :sites, only: [:index, :create, :show, :destroy]
      resources :pages, only: [:index, :create, :show, :destroy]
      resources :insights, only: [:index, :create, :show]
      resources :comments, only: [:index, :create, :show]
      resources :crawls, only: [:index, :create, :show]
      resources :keyterms, only: [:index, :create, :show]
    end
  end
end
