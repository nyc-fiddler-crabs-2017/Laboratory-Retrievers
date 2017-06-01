class UsersController < ApplicationController
  include UsersHelper
  def authenticate
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{current_user.id}"
    else
      @errors = ["We do not have that username and password combination on file."]
      render 'login'
    end
  end

  def create
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], username: params[:username], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect_to '/experiment_proposals'
    else
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  def logout
    session.clear
    redirect_to '/users/login'
  end

  def show
    @experiment_proposals = current_user.experiment_proposals
  end
end
