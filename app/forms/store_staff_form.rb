require_dependency 'store_staff'

class StoreStaffForm < StoreStaff
  validates :name, presence: true
  validates :cpf, cpf: true, presence: true
end