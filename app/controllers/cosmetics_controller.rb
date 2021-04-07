class CosmeticsController < ApplicationController

    get '/cosmetics' do
        redirect_to_login
        @cosmetics = Cosmetic.all
        erb :'cosmetics/index'
    end

    get '/cosmetics/new' do
        redirect_to_login
        erb :'cosmetics/new'
    end

    post '/cosmetics' do
        redirect_to_login
        cosmetic = current_user.cosmetics.create(params[:cosmetic])
        if cosmetic.save
            redirect "/cosmetics/#{@cosmetic.id}"
        else
            redirect '/cosmetics/new'
        end
    end

    get '/cosmetics/:id' do
        redirect_to_login
        @cosmetic = Cosmetic.find_by(id: params[:id])
        redirect '/cosmetics' unless @cosmetic
        erb :'cosmetics/show'
    end

    get '/cosmetics/:id/edit' do
        redirect_to_login
        @cosmetic = Cosmetic.find_by(id: params[:id])
        if !@cosmetic || @cosmetic.user_id != session[:user_id]
          redirect '/cosmetics'
        end
        erb :'cosmetics/edit'
    end
    
    patch '/cosmetics/:id' do
        redirect_to_login
        @cosmetic = Cosmetic.find_by(id: params[:id])
        if @cosmetic.user_id == session[:user_id]
            @cosmetic.update(params[:cosmetic])
        end
        erb :'cosmetics/show'
    end

    delete '/cosmetics/:id' do
        redirect_to_login
        @cosmetic = Cosmetic.find_by(id: params[:id])
        @cosmetic.delete
        redirect('/cosmetics')
    end

end