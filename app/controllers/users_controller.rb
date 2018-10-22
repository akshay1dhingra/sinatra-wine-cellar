require 'pry'

class UsersController < ApplicationController 

    get '/index' do 
        # binding.pry
        if logged_in?
            @user = User.all.find(session[:user_id])
            erb :'users/index'
        else 
            redirect '/login'
        end
    end 

    get '/signup' do 
        if !logged_in? 
            erb :'users/signup'
        else
            redirect "/index"
        end
    end 

    post '/signup' do
        # binding.pry
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        elsif @user = User.find_by(username: params[:username]) || @user = User.find_by(email: params[:email])
            redirect '/signup'
        else 
            @user = User.new(username: params[:username], email: params[:email], password: params[:password])
            @user.save
            session[:user_id] = @user.id 
            redirect '/index'
        end
    end

    get '/login' do 
        erb :'users/login'
    end 

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/index'
        else
          redirect '/signup'
        end
    end

    get '/logout' do 
        if logged_in?
            session.clear    
            redirect '/login'
        else
            redirect '/login'
        end
    end


end