class AddDueDates < ActiveRecord::Migration[5.0]
  def change
    add_column(:chores, :due_date, :datetime, :null => true)
  end
end
