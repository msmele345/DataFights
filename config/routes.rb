Rails.application.routes.draw do

    ##static home page
    root 'static_pages#home'

    get '/help', to: 'static_pages#help'

    post '/user_picks', to: 'static_pages#home'

    ##create a new user
    resources :users, only: [:new, :create, :show]

    ##manage stocks in db
    resources :stocks

    ##login routes
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'



end
