class BottlesController < ApplicationController 

    get '/bottles' do 
        if logged_in?
            erb :'bottles/bottles'
        else
            redirect to '/login'
        end
    end 

    get '/bottles/new' do 
        if logged_in? 
            erb :'bottles/create_bottle'
        else 
            redirect to '/login'
        end
    end

end