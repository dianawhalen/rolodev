Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  delete '/signout' => 'sessions#destroy'


  resources :submissions do
    resources :upvotes
  end
  resources :upvotes
  resources :users do
    resources :submissions, shallow: true
  end
  # resources :collections

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
