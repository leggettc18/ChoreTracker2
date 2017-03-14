class RemoveDefaultChoreName < ActiveRecord::Migration[5.0]
  def up
    change_column_default(:chores, :name, nil)
  end
  def down
    change_column_default(:chores, :name, :default=> "")
  end
end
