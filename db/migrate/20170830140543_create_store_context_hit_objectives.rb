class CreateStoreContextHitObjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :store_context_hit_objectives do |t|

      t.integer :context_id 
      t.integer :objective_id 
      t.text    :observation
      
      t.timestamps
    end
  end
end
