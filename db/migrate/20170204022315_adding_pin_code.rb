class AddingPinCode < ActiveRecord::Migration[5.0]
  def up
    add_column('parents', 'pincode', :string, :limit =>5, :after => 'email')
  end
  
  
  
  
  def down
    remove_column("parents", "pincode")
end
  
end
