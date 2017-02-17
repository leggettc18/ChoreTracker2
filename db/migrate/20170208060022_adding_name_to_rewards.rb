class AddingNameToRewards < ActiveRecord::Migration[5.0]
  def up
    add_column('rewards', 'name', :string)
  end
  
  def down
    remove_column('rewards','name')
  end
end
