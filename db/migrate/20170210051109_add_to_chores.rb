class AddToChores < ActiveRecord::Migration[5.0]
  def change
    add_column(:chores, :needs_approval?, :boolean, :default => false)
    add_column(:chores, :repeat_type, :integer, :default => 0)
    add_column(:chores, :repeat_data, :integer, :default => 0)
    remove_column(:chores, :repeat?)
    add_index(:chores, :parent_id)
  end
end
