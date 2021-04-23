class CreateThreads < ActiveRecord::Migration[6.1]
    def change
        create_table :threads do |t|
            
            t.string :title
            t.string :spoiler
            t.integer :user_id
            t.timestamps null: false
        end    
    end
end            
