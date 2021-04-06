class CosmeticsController < ApplicationController

    get '/cosmetics' do
        @cosmetics = Cosmetic.all
        erb :'cosmetics/index'
    end

    get '/cosmetics/new' do
        erb :'cosmetics/new'
    end

    post '/cosmetics' do
        user = User.find_by(id: session[:user_id])
        #cosmetic = Cosmetic.create(params[:cosmetic])
        cosmetic = user.cosmetics.new(params[:cosmetic])
        if cosmetic.save
            redirect "/cosmetics/#{@cosmetic.id}"
        else
            redirect '/cosmetics/new'
        end
        #erb :'cosmetics/show'
    end

    get '/cosmetics/:id' do
        @cosmetic = Cosmetic.find_by(id: params[:id])
        #issues handling, include helper
        erb :'cosmetics/show'
    end

    get '/cosmetics/:id/edit' do
        @cosmetic = Cosmetic.find_by(id: params[:id])
        if !@cosmetic || @cosmetic.user_id != session[:user_id]
          redirect '/cosmetics'
        end
        erb :'cosmetics/edit'
    end
    
    patch '/cosmetics/:id' do
        @cosmetic = Cosmetic.find_by(id: params[:id])
        if @cosmetic.user_id == session[:user_id]
            @cosmetic.update(params[:cosmetic])
        end
        erb :'cosmetics/show'
    end

    delete '/cosmetics/:id' do
        @cosmetic = Cosmetic.find_by(id: params[:id])
        @cosmetic.delete
        redirect('/cosmetics')
    end

end