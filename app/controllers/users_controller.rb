class UsersController < ApplicationController 

    get '/users' do 
        erb :'users/index'
    end 


end