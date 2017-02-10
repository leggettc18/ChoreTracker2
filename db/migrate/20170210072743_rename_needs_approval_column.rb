class RenameNeedsApprovalColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column(:chores, :needs_approval?, :needs_approval)
  end
end
