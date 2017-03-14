Rails.application.routes.draw do

  resources :users
  resources :comments
  resources :movies, only: [:show, :index]

  root to: "movies#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/search', to: 'movies#search'
  post '/movies/:id/like', to: 'movies#like'
  post '/watchlists', to: 'watchlists#create'

end
