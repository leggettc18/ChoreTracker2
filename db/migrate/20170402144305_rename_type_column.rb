class RenameTypeColumn < ActiveRecord::Migration[5.0]
  def up
    rename_column(:notifications, :type, :object_type)
  end
  
  def down
    rename_column(:notifications, :object_type, :type)
  end
end
