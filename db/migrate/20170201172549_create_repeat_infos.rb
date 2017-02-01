class CreateRepeatInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :repeat_infos do |t|
      t.integer :repeat_type # 0 for daily, 1 for weekly, 2 for monthly, enum value in model
       t.integer :repeat_data # for daily: useless, for weekly: 1-7 for day of the week, for monthly: 1-31 for day of the month
       t.integer :chore_id # foreign key to match with a chore entry

      t.timestamps
    end
    add_index :repeat_infos, :chore_id
  end
end
