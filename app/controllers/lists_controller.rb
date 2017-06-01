class ListsController < ApplicationController

  get '/lists' do
    if logged_in?
      @lists = List.all
      erb :'lists/lists'
    else
      redirect to '/login'
    end
  end

  get '/lists/new' do
    if logged_in?
      erb :'/lists/create_list'
    else
      redirect to '/login'
    end
  end

  post '/lists' do
    if params.value?('')
      redirect to '/lists/new'
    else
      user = User.find(session[:user_id])
      List.create(user_id: user.id, list_title: params[:list_title])
      redirect to '/lists'
    end
  end

  get '/lists/:id' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      erb :'/lists/show_list'
    else
      redirect to '/login'
    end
  end

  