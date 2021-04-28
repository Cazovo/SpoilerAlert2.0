class ThreadsController < ApplicationController
   


     #index 
  get "/threads" do 
    if current_user 
    @threads = Threads.all
    erb :"threads/index"
    end 
  end 

  #new 
  get "/threads/new" do 
    erb :"threads/new"
  end

  #create 
  post "/threads" do 
     
    if params[:title] == "" || params[:subject] == "" || params[:content] == ""
      redirect to "/threads/new"
    else 
      @thread = Threads.new(params[:threads])
      if @thread.save
        redirect to "/threads/#{@thread.id}"
      else 
        redirect to "/threads/new"
      end
    end 
  end 

  #show 
  get "/threads/:id" do 
    @thread = Threads.find_by_id(params[:id])
    if @thread 
      erb :"/threads/show"
    else 
      redirect to "/threads"
    end 
  end 

  #edit 
  get "/threads/:id/edit" do 
    @thread = Thread.find_by_id(params[:id])
    if @thread 
      erb :"/threads/edit"
    else 
      rediect to "/threads"
    end 
  end 

  #update 
  patch "/threads/:id" do 
    if params[:title] == "" || params[:subject] == "" || params[:content] == ""
      redirect to "/threads/#{params[:id]}/edit"
    else 
      @thread = Thread.find_by_id(params[:id])
      if @thread && @thread.update(params[:threads])
        redirect to "/threads/#{@thread.id}"
      else 
        redirect to "/threads/#{params[:id]}/edit"
      end
    end 
  end 

  #delete
  delete "/threads/:id/delete" do 
    @thread = Thread.find_by_id(params[:id])
    if @thread 
      @thread.delete
    end
    redirect to "/threads"
  end 
end 
