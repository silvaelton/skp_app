class StoreContextObjective < ApplicationRecord
  has_many :hit_objectives, class_name: StoreContextHitObjective, foreign_key: :objective_id
end
