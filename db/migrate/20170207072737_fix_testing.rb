class FixTesting < ActiveRecord::Migration[5.0]
  def up
    change_column_null :rewards, :parent_id, true
  end
  
  
  
  def down
    change_column_null :rewards, :parent_id, false
  end

end
