Rails.application.routes.draw do

  # get 'procedures/new'

  # get 'procedures/create'

  # get 'procedures/show'

  # get 'procedures/edit'

  # get 'procedures/update'

  # get 'procedures/destroy'

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


  resources :observations




  get '/experiments/:experiment_id/procedures/new', to: 'procedures#new'
  post '/experiments/:experiment_id/procedures', to: 'procedures#create'
  get '/experiments/:experiment_id/procedures/:id', to: 'procedures#show'
  get '/experiments/:experiment_id/procedures/:id/edit', to: 'procedures#edit'
  put '/experiments/:experiment_id/procedures/:id', to: 'procedures#update'
  delete '/experiments/:experiment_id/procedures/:id', to: 'procedures#destroy'


  get '/experiments/:id/comments/new', to: 'comments#new'
  post '/experiments/:id/comments', to: 'comments#create'
  get '/experiment_proposals/:id/comments/new', to: 'comments#new'
  post '/experiment_proposals/:id/comments', to: 'comments#create'
end
