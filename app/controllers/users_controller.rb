class UsersController < ApplicationController

    get '/signup' do                              
        if !logged_in? 
            erb :'users/signup'
        else
            redirect to '/projects'
        end 
    end

    post '/signup' do                            
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
            if User.all.none? {|user| params[:username] == user.username} 
                @user = User.new(params)
                @user.save
                session[:user_id] = @user.id 
                redirect to '/projects'           
            else                                  
                @error = "That username is already being used." 
                erb :'/users/signup'           
            end                                   
        else
            @error = "You must sign up with a username, email address, and password."                                      
            erb :'/users/signup'
        end          
    end
    
    get '/login' do                                
        if !logged_in?
            erb :'/users/login'
        else            
            redirect to '/projects'  
        end
    end 

    post '/login' do                               
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to '/projects' 
        else
            @error = "Invalid username or password. Please re-enter username and password, or return to sign up for an account." 
            erb :'/users/login' 
        end 
    end

    # get '/logout' do                                             
    #     if logged_in?
    #         erb :'users/logout'   
    #     else
    #         redirect to '/login'
    #     end 
    # end
    
    post '/logout' do                               
        if logged_in?
            session.destroy
            redirect to '/'  
        else
            redirect to '/login'
        end
    end 
    
end 