class CosmeticsController < ApplicationController

    #C+R routes below
    get '/cosmetics' do
        @cosmetics = Cosmetic.all
        erb :'cosmetics/index'
    end

    get '/cosmetics/new' do
        erb :'cosmetics/new'
    end

    post '/cosmetics' do
        #associates user with cosmetics
        user = User.find_by(id: session[:user_id])
        item = user.cosmetics.create(params[:cosmetic])
        #erb :'cosmetics/show'
        #only time to use :id dynamic syntax = set up dynamic routes, otherwise use redirects
        redirect "cosmetics/#{@cosmetic.id}"
    end

    get '/cosmetics/:id' do
        @cosmetic = Cosmetic.find_by(id: params[:id])
        #issues handling, use helper
        erb :'cosmetics/show'
    end

    #U+D routes below
    get '/cosmetics/:id/edit' do
        @item = Cosmetic.find_by(id: params[:id])
        #issues handling, use helper
        erb :'cosmetics/edit'
    end

    patch '/cosmetics/:id' do
        @cosmetic = Cosmetic.find_by(id: params[:id])
        @cosmetic.update(params[:cosmetic])
        erb :'cosmetics/show'
    end 

    delete '/cosmetics/:id' do
        @cosmetic = Cosmetic.find_by(id: params[:id])
        @cosmetic.delete
        redirect('/cosmetics')
    end

end