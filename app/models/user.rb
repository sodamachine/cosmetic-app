class User < ActiveRecord::Base
    has_many :cosmetics 
    has_secure_password #password=, authenticate

    #macro defines methods for us based on relationship
    #queries db using foreign key
    # ie. #cosmetics

    validates_uniqueness_of(:username)

end 