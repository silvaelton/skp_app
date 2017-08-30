require_dependency 'store'

class StoreForm < Store

  validates :name, :cnpj, :telephone, :city, :uf, :cep, :address, presence: true
  
end