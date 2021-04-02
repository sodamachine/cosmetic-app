class User < ActiveRecord::Base
    has_many :cosmetics 
    #macro that defines methods based on relationship ie. cosmetics

end