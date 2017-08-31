class CreateStoreGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :store_goals do |t|

      t.integer :context_id 
      t.string  :name 
      t.text    :description
      t.float   :minimum_value
      t.float   :goal_value 
      t.float   :exceed_minimum_percent
      t.float   :exceed_goal_percent
      t.float   :fixed_exceed_goal_value 
      
      t.timestamps
    end
  end
end
