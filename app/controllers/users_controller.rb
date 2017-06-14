class UsersController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/user_lists'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect to '/lists'
    end
  end

  post '/signup' do
    user = User.create(params) # have them create a new account
    # if user saves assign session id to user id redirect them to the lists
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

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
