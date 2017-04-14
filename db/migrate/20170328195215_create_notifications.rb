class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.boolean :unread, :default => true, :null => false
      t.integer :type
      t.integer :object_id
      t.integer :parent_id

      t.timestamps
    end
    add_index :notifications, :parent_id
  end
end
