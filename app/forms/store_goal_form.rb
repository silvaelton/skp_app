require_dependency 'store_goal'

class StoreGoalForm < StoreGoal
  validates_presence_of :name, 
                        :minimum_value, 
                        :goal_value, 
                        :exceed_minimum_percent, 
                        :exceed_goal_percent, 
                        :fixed_exceed_goal_value

end