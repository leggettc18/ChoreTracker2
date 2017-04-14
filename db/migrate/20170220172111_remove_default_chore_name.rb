class RemoveDefaultChoreName < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:chores, :name, :from => "", :to => nil)
  end
end
