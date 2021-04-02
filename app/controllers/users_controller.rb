class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/users' do
        u = User.create(params[:user])
        session[:user_id] = u.id
        redirect '/users/#{@user.id}'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end

    get '' do
    end

    get '' do
    end

end