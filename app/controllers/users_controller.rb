class UsersController < ApplicationController
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/user_comics'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect to '/comics'
    end
  end

  post '/signup' do
    user = User.create(params) # have them create a new account
    # if user saves assign session id to user id redirect them to the comics
    if user.save
      flash[:notice] = "Thanks for signing up!"
      session[:id] = user.id
      redirect to '/comics'
    else # otherwise
      # added for validation error messages
      flash[:error] = user.errors.full_messages.join
      redirect to '/signup' # redirect them to signup
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/comics'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/comics'
      elsif
        flash[:error] = "Invalid password"
        redirect to '/login'
      else
        flash[:error] = "Invalid username"
        redirect to '/login'
      end
    else
      flash.now[:error] = "This account does not exist. Please create one."
      redirect to '/signup'
    end
  end
  
  get '/logout' do
    if logged_in?
      session.destroy
      flash[:notice] = 'Successfully logged out.'
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
