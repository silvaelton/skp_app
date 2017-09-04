require_dependency 'store_context_objective'

class StoreContextObjectiveForm < StoreContextObjective

  validates :name, :score,  presence: true
end