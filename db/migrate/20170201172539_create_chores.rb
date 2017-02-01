class CreateChores < ActiveRecord::Migration[5.0]
  def change
    create_table :chores do |t|
      t.integer :child_id 
      t.boolean :repeat?, default: false, null: false
      t.integer :coins, default: 0, null: false
      t.string :name, default: "", null: false
      t.text :description

      t.timestamps
    end
    add_index :chores, :child_id
  end
end
