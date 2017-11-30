class IndirectTeamAward < ApplicationRecord
  validates :quantity, :percent, presence: true
  validates :context_id, uniqueness: true
end
