class StoreGoal < ApplicationRecord
  has_many :store_staff_scores, foreign_key: :goal_id
end
