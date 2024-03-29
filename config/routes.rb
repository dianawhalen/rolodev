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
    resources :submissions, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :collections, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  resources :submissions do
    get 'top_submissions', on: :collection

    post 'upvote', to: 'upvotes#create', as: 'upvote'
    delete 'upvote', to: 'upvotes#destroy', as: 'remove_upvote'
    resources :upvotes
    resources :collection_submissions, only: [:create, :destroy]
  end

  post 'submissions/:id/add_to_collection', to: 'submissions#add_to_collection', as: 'add_to_collection_submission'

  delete 'collections/:collection_id/remove_from_collection/:id', to: 'collection_submissions#destroy', as: 'remove_from_collection_collection_submission'

  resources :collections do
    resources :collection_submissions
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
