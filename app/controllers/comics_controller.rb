class ComicsController < ApplicationController
#  THIS AND FLASH SHOULD WORK OUTSIDE OF CORNEAL!
  before do 
    authenticate_user
  end

  get '/comics' do
    @comics = Comic.all
    erb :'comics/comics'
  end

  get '/comics/new' do
    erb :'/comics/add_comic'
  end

  post '/comics' do
    comic = current_user.comics.build(params[:comic])
    if comic.save
      redirect to '/comics'
    else
      flash[:notice] = comic.errors.full_messages.uniq.join(', ')
      erb :'/comics/add_comic'
    end
  end

  get '/comics/:id' do
    @comic = Comic.find_by_id(params[:id])
    erb :'/comics/show_comic'
  end

  get '/comics/:id/edit' do
    comic = current_user.comics.find_by(id: params[:id])
    if @comic
      erb :'/comics/edit_comic'
    else
      flash[:warning] = 'You can only edit your own comic books!'
      redirect to "/comics"
    end
  end

  patch '/comics/:id' do
    comic = current_user.comics.find_by(id: params[:id])
    if params.value?('')
      flash[:warning] = "Please make sure all fields are completed."
      redirect to "/comics/#{params[:id]}/edit"
    else
      comic.update(params)
      redirect to '/comics'
    end
  end

  get '/comics/:id/delete' do
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
