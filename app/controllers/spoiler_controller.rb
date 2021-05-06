class SpoilersController < ApplicationController
   

  #index 
get "/spoilers" do 
 if current_user 
 @spoilers = Spoiler.all
 erb :"spoilers/index"
 end 
end 
#new 
get "/spoilers/new" do 
 erb :"spoilers/new"
end
#create 
post "/spoilers" do 
  
 if params[:title] == "" || params[:subject] == "" || params[:content] == ""
   redirect to "/spoilers/new"
 else 
   @spoiler = Spoiler.new(params[:spoilers])
   if @spoiler.save
     redirect to "/spoilers/#{@spoiler.id}"
   else 
     redirect to "/spoilers/new"
   end
 end 
end 
#show 
get "/spoilers/:id" do 
 @spoiler = Spoiler.find_by_id(params[:id])
 if @spoiler 
   erb :"/spoilers/show"
 else 
   redirect to "/spoilers"
 end 
end 
get "/spoilers/:id/edit" do 
 @spoiler = Spoiler.find_by_id(params[:id])
 if @spoiler 
   erb :"/spoilers/edit"
 else 
   rediect to "/spoilers"
 end 
end 
patch "/spoilers/:id/edit" do 
 if logged_in?
     @spoiler = Spoiler.find_by_id(params[:id])
     #if current_user.id == @spoiler.user_id
        if @spoiler && @spoiler.update(params[:spoilers])
         redirect to "/spoilers/#{@spoiler.id}"
        end 
     #else 
       #redirect to "/spoilers/#{params[:id]}/edit"
     #end
 end 
end 



#delete
delete "/spoilers/:id/delete" do 
 @spoiler = Spoiler.find_by_id(params[:id])
 if @spoiler 
   @spoiler.delete
 end
 redirect to "/spoilers/index"
end 
end 