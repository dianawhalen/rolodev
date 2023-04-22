Rails.application.routes.draw do
  get 'collection_submissions/index'
  get 'collection_submissions/show'
  get 'collection_submissions/new'
  get 'collection_submissions/edit'
  get 'collection_submissions/create'
  get 'collection_submissions/update'
  get 'collection_submissions/destroy'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  resource :sessions, only: [:home, :new, :create, :destroy]

  resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :submissions, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :collections, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  resources :submissions do
    post 'upvote', to: 'upvotes#create', as: 'upvote'
    delete 'upvote', to: 'upvotes#destroy', as: 'remove_upvote'
    post 'collection', to: 'collections#add_submission_to_collection', as: 'add_submission_to_collection'
    resources :upvotes
    resources :collection_submissions, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  resources :collections do
    post 'collection', to: 'collections#add_submission_to_collection', as: 'add_submission_to_collection'
    resources :collection_submissions, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  resources :collection_submissions

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
