class AddPendingApprovalToChores < ActiveRecord::Migration[5.0]
  def change
        add_column(:chores, :pending_approval, :boolean, :default => false)
  end
end
