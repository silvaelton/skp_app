class StoreContext < ApplicationRecord
  has_many :store_goals, foreign_key: :context_id
  has_many :context_objectives, class_name: StoreContextObjective, foreign_key: :context_id
  has_many :evaluation_categories, class_name: ManagerEvaluationCategory, foreign_key: :context_id
end
