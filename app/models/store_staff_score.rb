class StoreStaffScore < ApplicationRecord
  belongs_to :staff, class_name: StoreStaff, foreign_key: :staff_id
end
