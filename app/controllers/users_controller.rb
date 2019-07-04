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

    post '/login' do                # create new session for existing user
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to '/projects' 
        else
            redirect to '/login'
        end 
    end

    get '/logout' do                # logout form for user                
        if logged_in?
            erb :'users/logout'   
        else
            redirect to '/login'
        end 
    end
    
    post '/logout' do               # logout existing user/end session. Return to login page.
        if logged_in?
            session.destroy
            redirect to '/'  
        else
            redirect to '/login'
        end
    end 
    
end 