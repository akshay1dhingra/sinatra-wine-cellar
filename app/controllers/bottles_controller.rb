require 'pry'

class BottlesController < ApplicationController 

    get '/bottles' do 
        if logged_in?
            # binding.pry
            erb :'bottles/index'
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


    get '/bottles/:id' do
        if logged_in?
            if @bottle = current_user.bottles.find_by_id(params[:id])
                erb :'bottles/show_bottle'
            else
                redirect to '/bottles'
            end
        else 
            redirect to '/login'
        end
    end


    get '/bottles/:id/edit' do 
        if logged_in?
            if @bottle = current_user.bottles.find_by_id(params[:id])
                erb :'bottles/edit_bottle'
            else
                redirect to '/bottles'
            end
        else
            redirect to '/login'
        end
    end


    patch '/bottles/:id/edit' do
        # @user = User.find_by(username: params[:username])
        # raise params.inspect
        if current_user.bottles.find_by_id(params[:id])
            @bottle = Bottle.find_by_id(params[:id])
            @bottle.name = params[:name]
            @bottle.grape = params[:grape]
            @bottle.year = params[:year]
            @bottle.location = params[:location]
            @bottle.save 
            redirect to '/bottles'
        else 
            redirect to '/bottles/:id'
        end
    end

    delete '/bottles/:id/delete' do 
        if logged_in?
            @bottle = Bottle.find_by_id(params[:id])
            if @bottle.user_id == current_user.id 
                @bottle.delete
                redirect to '/bottles'
            else 
                redirect to '/bottles'
            end
        else
            redirect to '/bottles'
        end
    end

end

