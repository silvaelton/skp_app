class CreateManagerEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_evaluations do |t|

      t.integer :staff_id 
      t.float   :score 
      t.text    :observation
      t.integer :context_id 
      t.date    :date
      t.integer :category_id
      
      t.timestamps
    end
  end
end
