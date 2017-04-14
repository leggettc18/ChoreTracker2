class AddAvatarToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :avatar, :string
  end
end
