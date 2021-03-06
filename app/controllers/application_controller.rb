class ApplicationController < Sinatra::Base

    configure do
        set(:views, 'app/views')
        enable :sessions
        set :session_secret, 'secret'
    end

    get '/' do
        erb :home
    end

    helpers do

        def current_user
            @user = User.find_by(id: session[:user_id])
        end

        def redirect_to_login
            redirect '/login' unless current_user
        end

    end

end