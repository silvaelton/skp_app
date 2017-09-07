require_dependency 'manager_evaluation'

class ManagerEvaluationForm < ManagerEvaluation

  attr_accessor :multi_score

  after_commit :set_avaliation

  private

  def set_avaliation
    self.category.criterions.each do |criterion|
    
      evaluation = self.evaluation_criterions.new
      evaluation.criterion_id = criterion.id

      if self.multi_score.present?
        
        if self.multi_score["#{criterion.id}"]['score'].blank? 
          current_score = 0
        else
          current_score = self.multi_score["#{criterion.id}"]['score'].to_f
        end 
      else
        current_score = 0
      end
      
      evaluation.score = current_score
      evaluation.save
      
      #evaluation.save
    end
  end

end