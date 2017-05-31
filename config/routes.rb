Rails.application.routes.draw do

  root "users#login"

  get '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'
  get '/users/new', to: 'users#new'

  post '/users', to: 'users#create'
  post '/users/login', to: 'users#authenticate'
  
  get '/users/:id', to: 'users#show'

  resources :experiment_proposals

end
