class UsersController < ApplicationController
  def login
  end

  def authenticate
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/posts'
    else
      redirect_to '/users/new'
    end
  end

  def new
  end

  def create
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect_to '/posts'
  end

  def logout
    session.clear
    redirect_to '/posts'
  end
end
