class AddChildPin < ActiveRecord::Migration[5.0]
  def change
      add_column(:children, :childPin, :string, :default => "", :limit => 5)
  end
end
