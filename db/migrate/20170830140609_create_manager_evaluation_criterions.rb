class CreateManagerEvaluationCriterions < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_evaluation_criterions do |t|

      t.integer :evaluation_id 
      t.integer :criterion_id 
      t.integer :category_id
      t.float   :score 
      
      t.timestamps
    end
  end
end
