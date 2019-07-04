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

    post '/projects' do                        # create new project from form
        if params[:project_name] != "" 
            @project = Project.new(params)
            @project.user = current_user
            @project.save
            redirect to "/projects/#{@project.id}"
        end
        redirect to '/projects/new'  
    end

    get '/projects/:id' do                     # read/view a specific project 
        if logged_in?  
            @project = Project.find_by_id(params[:id]) 
            erb :'/projects/show'   
        else 
            redirect to '/login'
        end 
    end

    get '/projects/:id/edit' do                # get form to edit project
        if logged_in?
            @project = Project.find_by_id(params[:id])
            if @project && @project.user == current_user
                erb :'/projects/edit'
            end 
        else 
            redirect to '/login'
        end 
    end

end 