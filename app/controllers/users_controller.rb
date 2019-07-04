class UsersController < ApplicationController

    get '/signup' do               # sign up form for new user
        if !logged_in? 
            erb :'users/signup'
        else
            redirect to '/projects'
        end 
    end
    
end 