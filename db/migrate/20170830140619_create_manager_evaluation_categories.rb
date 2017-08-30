class CreateManagerEvaluationCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :manager_evaluation_categories do |t|

      t.string  :name 
      t.boolean :status, default: true 
      t.integer :store_id
      t.float   :minimum_score
      
      t.timestamps
    end
  end
end
