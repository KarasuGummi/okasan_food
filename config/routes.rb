Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" i lik dumplings

  resources :listings, only: %i[index show new create destroy]
  resources :bookings
  
  namespace :momma do
    resources :bookings, only: %i[index edit update]
  end
end
