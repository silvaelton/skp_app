require_dependency 'store'

class StoreContextForm < StoreContext

  validates :title, :started_at, :ended_at, presence: true
end