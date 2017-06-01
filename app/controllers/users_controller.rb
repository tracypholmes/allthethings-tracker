class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect to '/lists'
    end
  end

  post '/signup' do
    user = User.create(params) # have them create a new account
    # if the user saves assign session id to user id then redirect them to the lists
    if user.save
      session[:id] = user.id
      redirect to '/lists'
    else # otherwise
      redirect to '/signup' # redirect them to signup
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/lists'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/lists'
    else
      redirect to '/signup'
    end
  end

end
