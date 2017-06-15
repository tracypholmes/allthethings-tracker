class ComicsController < ApplicationController
  get '/comics' do
    if logged_in?
      @comics = Comic.all
      erb :'comics/comics'
    else
      flash[:warning] = 'Please log in first to view your comic(s).'
      redirect to '/login'
    end
  end

  get '/comics/new' do
    if logged_in?
      erb :'/comics/add_comic'
    else
      redirect to '/login'
    end
  end

  post '/comics' do

    if params.value?('')
      redirect to '/comics/new'
    else
      user = User.find(session[:user_id])
      Comic.create(user_id: user.id, title: params[:title], series_name: params[:series_name], creator: params[:creator], publisher: params[:publisher], published_date: params[:published_date], issue: params[:issue], media_type: params[:media_type])
      redirect to '/comics'
    end
  end

  get '/comics/:id' do
    if logged_in?
      @comic = Comic.find_by_id(params[:id])
      erb :'/comics/show_comic'
    else
      redirect to '/login'
    end
  end

  get '/comics/:id/edit' do
    if logged_in?
      @comic = Comic.find_by_id(params[:id])
      if @comic.user_id == current_user.id
        erb :'/comics/edit_comic'
      else
        flash[:warning] = 'You can only edit your own comic books!'
        redirect to "/comics"
      end
    else
      redirect to '/login'
    end
  end

  patch '/comics/:id' do
    if logged_in?
      comic = current_user.comics.find_by(id: params[:id])
      if params.value?('')
        flash[:warning] = "Please make sure all fields are completed."
        redirect to "/comics/#{params[:id]}/edit"
      else
        comic.update(title: params[:title], series_name: params[:series_name], creator: params[:creator], publisher: params[:publisher], published_date: params[:published_date], issue: params[:issue], media_type: params[:media_type])
        redirect to '/comics'
      end
    else
      redirect to '/login'
    end
  end

  delete '/comics/:id/delete' do
    if logged_in?
      comic = current_user.comics.find_by(id: params[:id])
      if comic
        comic.delete
        redirect to '/comics'
      else
        flash[:warning] = 'You can only delete your own comics!'
        redirect to "/comics/#{params[:id]}"
      end
    end
  end
end
