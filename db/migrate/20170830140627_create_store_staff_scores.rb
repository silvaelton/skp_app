class CreateStoreStaffScores < ActiveRecord::Migration[5.1]
  def change
    create_table :store_staff_scores do |t|

      t.integer :staff_id 
      t.integer :goal_id 
      t.float   :score_value
      
      t.timestamps
    end
  end
end
