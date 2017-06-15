class ListsController < ApplicationController

  get '/lists' do
    if logged_in?
      @lists = List.all
      erb :'lists/lists'
    else
      flash[:notice] = "Please log in first to view your list(s)."
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

  get '/lists/:id/edit' do
    if logged_in?
      @list = List.find_by_id(params[:id])
      if @list.user_id == current_user.id
        erb :'/lists/edit_list'
      else
        flash[:notice] = "You can only edit your own list(s)."
        redirect to "/lists/#{params[:id]}"
      end
    else
      redirect to '/login'
    end
  end

  patch '/lists/:id' do
    if logged_in?
      list = current_user.lists.find_by(id: params[:id])
      if params.value?('')
        redirect to "/lists/#{params[:id]}/edit"
      else
        list.update(list_title: params[:list_title])
        redirect to '/lists'
      end
    else
      redirect to '/login'
    end
  end

  delete '/lists/:id/delete' do
    if logged_in?
      list = current_user.lists.find_by_id(params[:id])
      if list
        list.delete
        redirect to '/lists'
      else
        redirect to "/lists/#{params[:id]}"
      end
    end
  end
end

