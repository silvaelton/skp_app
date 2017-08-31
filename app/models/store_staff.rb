class StoreStaff < ApplicationRecord
  enum job: ['vendedor', 'gerente']
end
