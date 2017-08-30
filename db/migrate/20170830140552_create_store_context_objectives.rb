class CreateStoreContextObjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :store_context_objectives do |t|

      t.string  :name 
      t.boolean :status, default: true
      t.float   :score
      t.integer :context_id
      
      t.timestamps
    end
  end
end
