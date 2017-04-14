class RewardsAddChildid < ActiveRecord::Migration[5.0]
  def up
    add_column(:rewards, :child_id, :integer)
    add_index(:rewards, :child_id)
  end
  
  def down
    remove_column(:rewards, :child_id)
    
  end
end
