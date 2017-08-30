class CreateIndirectTeamAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :indirect_team_awards do |t|

      t.integer :context_id 
      t.float   :percent
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
