class AddAvatarToChildren < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :avatar, :string
  end
end
