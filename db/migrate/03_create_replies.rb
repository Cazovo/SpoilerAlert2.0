class CreateReplies < ActiveRecord::Migration[6.1]
    def change
        create_table :replies do |t|
            t.integer :thread_id
            t.timestamps null: false   
        end
    end
end            