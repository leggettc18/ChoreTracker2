class AddingGroupIDtoChores < ActiveRecord::Migration[5.0]
  def change
    add_column(:chores, :group_id, :int, :null => true )
  end
end
