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
        @cosmetic = Cosmetic.create(params[:cosmetic])
        #erb :'cosmetics/show'
        #only time to use :id dynamic syntax = set up dynamic routes, otherwise use redirects
        redirect "cosmetics/#{@cosmetic.id}"
    end

    get '/cosmetics/:id' do
        @cosmetic = Cosmetic.find(params[:id])
        erb :'cosmetics/show'
    end

    #U+D routes below
    get '/cosmetics/:id/edit' do
        @item = Cosmetic.find(params[:id])
        erb :'cosmetics/edit'
    end

    patch '/cosmetics/:id' do
        @cosmetic = Cosmetic.find(params[:id])
        @cosmetic.update(params[:cosmetic])
        erb :'cosmetics/show'
    end 

    delete '/cosmetics/:id' do
        @cosmetic = Cosmetic.find(params[:id])
        @cosmetic.delete
        redirect('/cosmetics')

end