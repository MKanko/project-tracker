class ProjectsController < ApplicationController

    get '/projects' do                           # index
        if logged_in?                            # page should show all user projects with link to
            @projects = current_user.projects    #  a page to view each project and then link to 
            erb :'projects/index'                #  edit or delete a project - '/projects/:id/delete'
        else                                     # should have link to create a new project - '/projects/new'
            redirect to '/login'
        end 
    end

    get '/projects/new' do                       # form to create new project
        if logged_in?
            erb :'projects/new' 
        else 
            redirect to '/login'
        end 
    end

    post '/projects' do                          # create new project from form
        if params[:project_name] != "" 
            @project = Project.new(params)
            @project.user = current_user
            @project.save
            redirect to "/projects/#{@project.id}"
        else 
            @error = "A project must have a name!"
            erb :'/projects/new'
        end  
    end

    get '/projects/:id' do                       # read/view a specific project 
        if logged_in?  
            @project = Project.find_by_id(params[:id]) 
            erb :'/projects/show'   
        else 
            redirect to '/login'
        end 
    end

    get '/projects/:id/edit' do                  # get form to edit project
        if logged_in?
            @project = Project.find_by_id(params[:id])
            if @project && @project.user == current_user
                erb :'/projects/edit'
            else 
                redirect to '/projects'  
            end 
        else 
            redirect to '/login'
        end 
    end

    patch '/projects/:id' do                     # update project from edit form
        @project = Project.find_by_id(params[:id])
        if params[:project_name] != "" 
            @project.update(project_name: params[:project_name], description: params[:description], subs: params[:subs],
            total_cost: params[:total_cost], sub_cost: params[:sub_cost], project_status: params[:project_status], 
            billing_status: params[:billing_status])   
            redirect to "/projects/#{@project.id}"
        else
            redirect to "/projects/#{@project.id}/edit" 
        end 
    end

    delete '/projects/:id/delete' do            # delete project 
        if logged_in?
            @project = Project.find_by_id(params[:id])
            if @project && @project.user == current_user
                @project.delete
            end                
            redirect to '/projects'
        else 
            redirect to '/login'
        end
    end

end 