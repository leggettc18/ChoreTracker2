class CreateChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :children do |t|
      t.integer :parent_id, null: false, default: 0
      t.string :name, null: false, default: ""
      t.boolean :frozen?, null: false, default: false #is the child grounded?
      t.integer :balance, null: false, default: 0

      t.timestamps
    end
    add_index :children, :parent_id
  end
end
