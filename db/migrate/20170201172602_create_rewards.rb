class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.integer :cost, null: false, default: 0
      t.boolean :auto_approve?, null: false, default: false #if true, parent does not have to approve reward redemption
      t.integer :parent_id, null: false #has to be attached to the parent that created it, so the application can know which child to offer it to.

      t.timestamps
    end
    add_index :rewards, :parent_id
  end
end
