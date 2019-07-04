class ProjectsController < ApplicationController

    get '/projects' do                           # index
        if logged_in?                            # page should show all user projects with link to
            @projects = current_user.projects    # edit a project - '/projects/:id/edit'  
            erb :'projects/index'                # or delete a project - '/projects/:id/delete'
        else                                     # should have link to create a new project - '/projects/new'
            redirect to '/login'
        end 
    end

    get '/projects/new' do                     # form to create new project
        if logged_in?
            erb :'projects/new' 
        else 
            redirect to '/login'
        end 
    end

end 