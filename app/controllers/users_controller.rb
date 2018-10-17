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

    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect '/bottles'
        else
          redirect '/signup'
        end
      end


end