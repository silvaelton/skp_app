class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|

      t.string :name 
      t.string :cnpj 
      t.string :telephone
      t.string :address
      t.string :address_complement
      t.string :address_number
      t.string :neighborhood
      t.string :city
      t.string :uf
      t.string :cep

      t.boolean :status, default: true 
      t.integer :user_id 
      
      t.timestamps
    end
  end
end
