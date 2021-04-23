class UsersController < ApplicationController

    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do 
        user = User.create(first_name: params[:first_name], 
        last_name: params[:last_name],
        email: params[:email], 
        username: params[:username], 
        password: params[:password])

        if user.valid?
            session[:user_id] = user.id
            redirect '/threads'
        else 
            redirect '/login'
        end
    end
end