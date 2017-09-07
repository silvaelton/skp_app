class CreateManagerCriterions < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_criterions do |t|

      t.string  :name
      t.boolean :status, default: true
      t.integer :store_id
      t.integer :context_id
      t.integer :category_id
      
      t.timestamps
    end
  end
end
