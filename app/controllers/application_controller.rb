require './config/environment' 

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super secret"
  end

  get "/" do
    erb :home_page   
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      if session[:user_id] 
        @current_user = User.find_by_id(session[:user_id])         
      end   
    end
  end

end
