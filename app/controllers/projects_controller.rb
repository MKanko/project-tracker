 class ProjectsController < ApplicationController

    get '/projects' do                          
        if logged_in?                            
            @projects = Project.all             
            erb :'/projects/index'              
        else
            @error = "You must be logged in to view projects."                                     
            erb :'/users/login'
        end                             
    end

    get '/projects/new' do                     
        if logged_in?
            erb :'/projects/new'             
        else
            @error = "You must be logged in to create a project." 
            erb :'/users/login'
        end 
    end

    post '/projects' do
        if Project.all.none? {|project| params[:project_name] == project.project_name}   
            if params[:project_name] != "" 
                @project = Project.new(params)
                @project.user = current_user    
                @project.save
                redirect to "/projects/#{@project.id}"
            else 
                @error = "A project must have a name!"  
                erb :'/projects/new'
            end
        else
            @error = "This project already exists."
            erb :'/projects/new'
        end     
    end

    get '/projects/:id' do                      
        if logged_in?  
            @project = Project.find_by_id(params[:id]) 
            erb :'/projects/show'   
        else 
            @error = "You must be logged in to view a project." 
            erb :'/users/login'
        end 
    end

    get '/projects/:id/edit' do              
        if logged_in?
            @project = Project.find_by_id(params[:id])
            if @project && @project.user == current_user
                erb :'/projects/edit'
            else 
                redirect to '/projects'  
            end 
        else 
            @error = "You must be logged in to edit a project."
            erb :'/users/login'
        end 
    end

    patch '/projects/:id' do
        if logged_in?                     
            @project = Project.find_by_id(params[:id])
            if params[:project_name] != ""  
                @project.update(project_name: params[:project_name], description: params[:description], subs: params[:subs],
                total_cost: params[:total_cost], sub_cost: params[:sub_cost], project_status: params[:project_status],
                billing_status: params[:billing_status])   
                redirect to "/projects/#{@project.id}"
            else
                redirect to "/projects/#{@project.id}/edit" 
            end
        else 
            @error = "You must be logged in to edit a project."
            erb :'/users/login'
        end  
    end

    delete '/projects/:id/delete' do           
        if logged_in?
            @project = Project.find_by_id(params[:id])
            if @project && @project.user == current_user
                @project.delete
            end                
            redirect to '/projects' 
        else
            @error = "You must be logged in to delete a project."  
            erb :'/users/login'
        end
    end

end 