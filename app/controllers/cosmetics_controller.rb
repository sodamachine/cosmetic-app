class CosmeticsController < ApplicationController

    get '/cosmetics' do
        @cosmetics = Cosmetic.require_all
        erb :'cosmetics/index'
    end

    get '/cosmetics/new' do
        erb :'cosmetics/new'
    end

    post '/cosmetics' do
        @cosmetic = Cosmetic.create(name: params[:cosmetic][:name])
        erb :'cosmetics/show'
    end

    get '/cosmetics/:id' do
        erb :'cosmetics/show'
    end

end