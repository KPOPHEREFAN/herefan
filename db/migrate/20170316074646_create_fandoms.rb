class CreateFandoms < ActiveRecord::Migration[5.0]
    def change
        create_table :fandoms do |t|
            # t.references :artist, foreign_key: true
            # t.references :group, foreign_key: true
            t.integer :admin_id
            
            t.string :name
            
            t.string :title
            t.string :subtitle
            t.string :description
            
            t.string :bg_img
            t.string :profile_img
            
            t.timestamps
        end
    end
end
