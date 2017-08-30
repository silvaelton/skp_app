class CreateStoreContexts < ActiveRecord::Migration[5.1]
  def change
    create_table :store_contexts do |t|

      t.string  :title
      t.text    :description
      t.integer :store_id 
      t.date    :started_at 
      t.date    :ended_at
      t.boolean :status, default: true 
      t.text    :manager_ids, array: true

      t.timestamps
    end
  end
end
