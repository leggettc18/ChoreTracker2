class AddingRepeatUntilToChores < ActiveRecord::Migration[5.0]
  def change
        add_column(:chores, :repeat_until, :datetime, :null => true)
  end
end
