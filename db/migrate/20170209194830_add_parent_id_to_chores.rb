class AddParentIdToChores < ActiveRecord::Migration[5.0]
  def change
    add_column(:chores, :parent_id, :integer, {:after => :child_id})
  end
end
