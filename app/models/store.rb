class Store < ApplicationRecord
  has_many :store_contexts
  has_many :store_staffs, -> { where(job: 'vendedor') }
  has_many :store_managers, -> { where(job: 'gerente')}, class_name: StoreStaff
end
