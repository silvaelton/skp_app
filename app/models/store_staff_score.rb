class StoreStaffScore < ApplicationRecord

  belongs_to :staff, class_name: StoreStaff, foreign_key: :staff_id
  belongs_to :goal, class_name: StoreGoal


  validates_uniqueness_of :staff_id, scope: :goal
  #FORMATACAO

  def score_value
    ('%.2f' % self[:score_value]) rescue 0
  end
  

  #PORCENTAGEM DE VENDA
  def score_percent
    (100 / (self.goal.store_staff_scores.sum(:score_value).to_f  / self.score_value.to_f )).round(2)  rescue 0
  end

  def score_execeed
    (self.goal.sum_exceed_minimum_percent.to_f  * self.score_percent.to_f ) / 100
  end

  def score_goal_execeed
    (self.goal.sum_exceed_goal_percent.to_f  * self.score_percent.to_f ) / 100
  end

  def score_fixed
    if self.goal.score_goal_premium.to_f  > 0
      self.goal.fixed_exceed_goal_value.to_f  
    else
      0
    end
  end

  def score_total
    (self.score_execeed.to_f  +  self.score_goal_execeed.to_f  + self.score_fixed.to_f)
  end

end
