require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'nunyabidness'
    use Rack::Flash
  end

  get '/' do
    erb :index
  end

  helpers do
    # Feature Luke wanted, but it wouldn't work. Implement it last.
    # def authenticate_user
    #   unless logged_in?
    #     redirect to '/login'
    #   end
    # end
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def prettify_date(time)
	    time.strftime("%d %b %Y") unless time == nil
    end 
  end
end
