class BottlesController < ApplicationController 

    get '/bottles' do 
        if logged_in?
            erb :'bottles/bottles'
        else
            redirect to '/login'
        end
    end 

end