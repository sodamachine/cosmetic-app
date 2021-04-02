class CreateUsers < ActiveRecord::Migrations
    def change
        create_table :users do |t|
            t.string :username
            t.string :passwords
        end
    end
end