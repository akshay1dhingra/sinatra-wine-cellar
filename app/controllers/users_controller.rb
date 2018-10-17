class UsersController < ApplicationController 

    get '/index' do 
        erb :'users/index'
    end 

    get '/signup' do 
        if !logged_in? 
            erb :'users/signup'
        else
            redirect "/index"
        end
    end 

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        else 
            @user = User.new(username: params[:username], email: params[:email], password: params[:password])
            @user.save
            session[:user_id] = @user.id 
            redirect '/bottles'
        end
    end

    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/bottles'
        else
          redirect '/signup'
        end
    end

    post '/logout' do 
        if logged_in?
            session.clear    
            redirect '/login'
        else
            redirect '/login'
        end
    end


end