Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" i lik dumplings
  # root "articles#index" i lik dumplings
  resources :listings, only: %i[index show new create destroy] do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[index edit destroy update]

  namespace :momma do
    resources :bookings, only: %i[index edit update]
  end

  namespace :momma do
    resources :listings, only: %i[index edit update destroy]
  end
end
