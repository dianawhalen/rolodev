Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  resource :sessions, only: [:home, :new, :create, :destroy]

  resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :submissions, only: [:new, :create, :edit, :update, :destroy]
    resources :collections, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :submissions, only: [:index, :show] do
    resources :upvotes, only: [:create, :destroy]
  end

  resources :collections, only: [:show] do
    resources :collection_submissions, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
