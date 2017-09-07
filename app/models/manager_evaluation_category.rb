class ManagerEvaluationCategory < ApplicationRecord

  has_many :criterions, class_name: ManagerCriterion, foreign_key: :category_id
  has_many :evaluation_criterions, class_name: ManagerEvaluationCriterion, foreign_key: :category_id
  has_many :evaluates, class_name: ManagerEvaluation, foreign_key: :category_id
  
  def minimum_score
    ('%.2f' % self[:minimum_score]) rescue 0
  end

end
