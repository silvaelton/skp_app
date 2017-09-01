class StoreGoal < ApplicationRecord

  belongs_to :store_context, foreign_key: :context_id

  has_many :store_staff_scores, foreign_key: :goal_id
  
  # CONFIGURANDO VALORES
  def minimum_value
    ('%.2f' % self[:minimum_value]) rescue 0
  end

  def goal_value
    ('%.2f' % self[:goal_value]) rescue 0
  end

  def exceed_minimum_percent
    ('%.2f' % self[:exceed_minimum_percent]) rescue 0
  end

  def exceed_goal_percent
    ('%.2f' % self[:exceed_goal_percent]) rescue 0
  end

  def fixed_exceed_goal_value
    ('%.2f' % self[:fixed_exceed_goal_value]) rescue 0
  end

  # EXCENDENTE REALIZADO
  def sum_exceed
    total = (self.store_staff_scores.sum(:score_value).to_f - self.minimum_value.to_f)  rescue 0
    
    total <= 0 ? 0 : total
  end

  # PRÊMIO PELO EXCEDENTE
  def sum_exceed_minimum_percent
    ((self.exceed_minimum_percent.to_f * self.sum_exceed.to_f) / 100) rescue 0
  end

  # PRÊMIO PELA SUPERAÇÃO DA META
  def sum_exceed_goal_percent
    ((self.exceed_goal_percent.to_f * self.score_goal_premium.to_f) / 100) rescue 0
  end

  # DIFERENÇA EM RELAÇÃO À META
  def scores_goal_difference
    (self.store_staff_scores.sum(:score_value).to_f - self.goal_value.to_f) rescue 0
  end

  # BASE DO PRÊMIO DE SUPERAÇÃO
  def score_goal_premium
    (self.scores_goal_difference.to_f <= 0) ? 0 : self.scores_goal_difference.to_f
  end



end
