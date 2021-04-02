class ApplicationController < Sinatra::Base

    configure do
        set(:views, 'app/views')
        set :public_folder, 'public'
        enable :sessions #so that Sinatra can work with browser to store user info via cookie hash
        set :session_secret, 'secret' #bc shotgun generates new server/request, browser now won't update cookie per new session
    end

    get('/') do
        @name = "test"
        erb :home
    end

end