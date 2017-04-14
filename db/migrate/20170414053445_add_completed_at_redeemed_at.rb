class AddCompletedAtRedeemedAt < ActiveRecord::Migration[5.0]
  def change
    add_column(:chores, :completed_at, :datetime, :null => true)
    add_column(:rewards, :redeemed_at, :datetime, :null => true)
    
  end
end
