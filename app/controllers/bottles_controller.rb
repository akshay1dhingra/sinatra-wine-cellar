require 'pry'

class BottlesController < ApplicationController 

    get '/bottles' do 
        if logged_in?
            # binding.pry
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

    post '/bottles/new' do 
        if logged_in?
            if params[:name] == "" || params[:grape] == "" || params[:year] == "" || params[:location] == ""
                redirect to '/bottles/new'
            else
                # binding.pry
                @bottle = current_user.bottles.create(name: params[:name], grape: params[:grape], year: params[:year], location: params[:location])
                redirect to '/bottles'
            end
        else
            redirect to '/login'
        end
    end

end

