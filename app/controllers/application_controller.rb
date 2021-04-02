class ApplicationController < Sinatra::Base

    configure do
        set(:views, 'app/views')
        set :public_folder, 'public'
    end

    get('/') do
        @name = "test"
        erb :home
    end

    

end