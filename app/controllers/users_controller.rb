class UsersController < ApplicationController 

    get '/index' do 
        erb :'users/index'
    end 

    get '/signup' do 
        if !logged_in? 
            erb :'users/signup'
        else
            redirect "users/index"
        end
    end 

    get '/login' do 
        erb :'users/login'
    end 


end