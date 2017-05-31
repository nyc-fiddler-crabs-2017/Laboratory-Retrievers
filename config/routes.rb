Rails.application.routes.draw do
  get '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  post '/users/login', to: 'users#authenticate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
