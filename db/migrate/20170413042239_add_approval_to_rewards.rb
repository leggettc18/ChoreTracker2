class AddApprovalToRewards < ActiveRecord::Migration[5.0]
  def up
    add_column(:rewards, :pending_approval, :boolean, :default => false)
  end
  
  def down
    remove_column(:rewards, :pending_approval)
  end
end
