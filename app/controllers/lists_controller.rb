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

  