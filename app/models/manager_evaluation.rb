class ManagerEvaluation < ApplicationRecord
  belongs_to :category, class_name: ManagerEvaluationCategory, foreign_key: :category_id
  has_many   :evaluation_criterions, class_name: ManagerEvaluationCriterion, foreign_key: :evaluation_id


  def total_score
    total_score = 0
    
    self.evaluation_criterions.each do |criterion|
      total_score += (criterion.score / self.evaluation_criterions.count)
    end

    ('%.2f' % total_score) rescue 0
  end

end

