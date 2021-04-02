class User < ActiveRecord::Base
    has_many :cosmetics 
    #macro defines methods based on relationship
    #queries db using foreign key
    # ie. #cosmetics

end 