class UsersController < ApplicationController

  def authenticate
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to '/users/new'
    end
  end

  def create
    user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect_to '/experiments'
  end

  def logout
    session.clear
    redirect_to '/users/login'
  end
end
