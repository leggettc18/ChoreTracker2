class ChangeNotificationsTable < ActiveRecord::Migration[5.0]
  def up
    rename_column(:notifications, :parent_id, :user_id)
    add_column(:notifications, :user_type, :integer)
  end
  def down
    remove_column(:notifications, :user_type)
    rename_column(:notifications, :user_id, :parent_id)
  end
end
