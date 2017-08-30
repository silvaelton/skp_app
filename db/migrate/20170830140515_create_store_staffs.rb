class CreateStoreStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :store_staffs do |t|

      t.string  :name
      t.string  :cpf 
      t.integer :job, default: 0
      t.integer :store_id 
      
      t.timestamps
    end
  end
end
