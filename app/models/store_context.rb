class StoreContext < ApplicationRecord
  has_many :store_goals, foreign_key: :context_id
end
