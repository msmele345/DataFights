Rails.application.routes.draw do

    ##static home page
    root 'static_pages#home'

    ##create a new user
    resources :users, only: [:new, :create, :show]

    ##login routes
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'



end
