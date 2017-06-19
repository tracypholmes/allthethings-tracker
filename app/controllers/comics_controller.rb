class ComicsController < ApplicationController
  # before do
  #   authenticate_user
  # end
  
  get '/comics' do
    if logged_in?
      @comics = Comic.all
      erb :'comics/comics'
    else
      flash[:notice] = 'Please log in first to view your comic(s).'
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
  comic = current_user.comics.build(params[:comic])
    if comic.save
      redirect to '/comics'
    else
      flash[:notice] = comic.errors.full_messages.uniq.join(',')
      erb :'/comics/add_comic'
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
      @comic = current_user.comics.find_by(id: params[:id])
      if @comic
        erb :'/comics/edit_comic'
      else
        flash[:notice] = 'You can only edit your own comic books!'
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
        flash[:notice] = "Please make sure all fields are completed."
        redirect to "/comics/#{params[:id]}/edit"
      else #tried this with (params) and did not work!
        comic.update(title: params[:title], series_name: params[:series_name], creator: params[:creator], publisher: params[:publisher], published_date: params[:published_date], issue: params[:issue], media_type: params[:media_type])
        redirect to '/comics'
      end
    else
      redirect to '/login'
    end
  end

  get '/comics/:id/delete' do
    if logged_in?
      comic = current_user.comics.find_by(id: params[:id])
      if comic
        comic.delete
        redirect to '/comics'
      else
        flash[:notice] = 'You can only delete your own comics!'
        redirect to "/comics/#{params[:id]}"
      end
    end
  end
end
