class UsersController < ApplicationController

    get '/signup' do               # sign up form for new user
        if !logged_in? 
            erb :'users/signup'
        else
            redirect to '/projects'
        end 
    end

    post '/signup' do                         # create new user
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?  
            @user = User.new(params)
            @user.save
            session[:user_id] = @user.id      # check that a new user has signed up with
            redirect to '/projects'           # a username, email, and pass word. Create
        else                                  # new user and assign session, redirect to tweets.
            redirect to '/signup'
        end          
    end
    
    get '/login' do                 # login form for existing user
        if !logged_in?
            erb :'/users/login'
        else
            redirect to '/projects'  
        end
    end 
    
end 