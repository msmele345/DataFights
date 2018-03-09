Rails.application.routes.draw do

    ##static home page
    root 'static_pages#home'

    get '/help', to: 'static_pages#help'

    delete '/delete', to:'watchlists#destroy'

    # post '/user_picks', to: 'static_pages#home'
    post '/user_picks', to: 'users#show'

    ##create a new user
    resources :users, only: [:new, :create, :show]

    ##manage stocks in db
    resources :stocks

    ##add new stocks to watchlists
    resources :watchlists, only: [:new, :create, :destroy]

    ##add new quotes
    resources :historical_quotes, only: [:new, :create, :destroy, :show]

    ##create new games
    resources :games

    ##new game



    ##login routes
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'



end
