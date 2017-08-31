require_dependency 'store_staff_score'

class StoreStaffScoreForm < StoreStaffScore
  validates :staff_id, :score_value, presence: true
end
