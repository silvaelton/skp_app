class StoreGoal < ApplicationRecord

  belongs_to :store_context, foreign_key: :context_id

  has_many :store_staff_scores, foreign_key: :goal_id


  # EXCENDENTE REALIZADO
  def sum_exceed
    total = (self.store_staff_scores.sum(:score_value) - self.minimum_value)  rescue 0
    
    total <= 0 ? 0 : total
  end

  # PRÊMIO PELO EXCEDENTE
  def sum_exceed_minimum_percent
    ((self.exceed_minimum_percent * self.sum_exceed) / 100) rescue 0
  end

  # PRÊMIO PELA SUPERAÇÃO DA META
  def sum_exceed_goal_percent
    ((self.exceed_goal_percent * self.score_goal_premium) / 100) rescue 0
  end

  # DIFERENÇA EM RELAÇÃO À META
  def scores_goal_difference
    (self.store_staff_scores.sum(:score_value) - self.goal_value) rescue 0
  end

  # BASE DO PRÊMIO DE SUPERAÇÃO
  def score_goal_premium
    (self.scores_goal_difference <= 0) ? 0 : self.scores_goal_difference
  end



end
