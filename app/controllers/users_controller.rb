class UsersController < ApplicationController 

    get '/users/index' do 
        erb :'users/index'
    end 

    get '/users/signup' do 
        if !logged_in? 
            erb :'users/signup'
        else
            redirect "users/index"
        end
    end 

    get '/users/login' do 
        erb :'users/login'
    end 


end