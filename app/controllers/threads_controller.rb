class ThreadsController < ApplicationController
       
    #shows current users threads
    get '/threads' do
        if logged_in?
            @thread = current_user.threads
            erb :'threads/index'
        else
           redirect '/login'
        end
    end
    
    #creates new threads
    get '/threads/new' do
        if logged_in?
            erb :'threads/new'
        end
        
    end
    #creates new threads
    post '/threads' do 
        if logged_in?
            thread = current_user.threads.create(title: params[:title], 
                                                 spoiler: params[:spoiler])

            if thread
                redirect '/threads'
            else 
                redirect 'threads/new'
            end

        else
            redirect '/login'
        end
    end

    #deletes thread
    delete '/threads/:id' do
        if logged_in?
            threads = current_user.threads.find_by(id: params[:id])
            if threads.user = current_user
               thread.destroy
            end   

            redirect '/threads'
        else
            redirect '/login'
        end 
    end    
end
