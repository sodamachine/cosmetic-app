class CreateCosmetics < ActiveRecord::Migrations
    def change
        create_table :cosmetics do |t|
            t.string :name
            t.string :quantity
            t.integer :user_id
        end
    end
end