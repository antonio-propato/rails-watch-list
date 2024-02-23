Rails.application.routes.draw do
  # get 'bookmarks/index'
  # get 'lists/index'
  # get 'movies/movies'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: :destroy

  # get '/movies', to: 'movies#index'

  # get '/lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new', as: :new_list
  # post 'lists/:id', to: 'lists#create'
  # get 'lists/:id', to: 'lists#show', as: :list

  # get '/bookmarks', to: 'bookmarks#index'
end
