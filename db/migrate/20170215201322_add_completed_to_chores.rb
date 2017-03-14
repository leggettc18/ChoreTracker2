class AddCompletedToChores < ActiveRecord::Migration[5.0]
  def change
    add_column :chores, :completed_at, :datetime
  end
end
