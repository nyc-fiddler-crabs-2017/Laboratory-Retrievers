Rails.application.routes.draw do

  root "users#login"

  get '/users/login', to: 'users#login'
  get '/users/logout', to: 'users#logout'
  get '/users/new', to: 'users#new'

  post '/users', to: 'users#create'
  post '/users/login', to: 'users#authenticate'
  
  get '/users/:id', to: 'users#show'


#   resources :experiment_proposal do
#     get '/experiment_proposal/:experiment_proposal_id/experiments', to: 'experiments#index'
#     get '/experiment_proposal/:experiment_proposal_id/experiments/new', to: 'experiments#new'
#     post '/experiment_proposal/:experiment_proposal_id/experiments', to: 'experiments#create'
#     get '/experiment_proposal/:experiment_proposal_id/experiments/:id', to: 'experiments#show'
#     get '/experiment_proposal/:experiment_proposal_id/experiments/:id/edit', to: 'experiments#edit'
#     put '/experiment_proposal/:experiment_proposal_id/experiments/:id', to: 'experiments#update'
#     delete '/experiment_proposal/:experiment_proposal_id/experiments/:id', to: 'experiments#destroy'
#   end

  resources :experiment_proposals do
    resources :experiments  
  end
  


end
