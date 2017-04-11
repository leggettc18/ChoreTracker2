class SetDefaultPin < ActiveRecord::Migration[5.0]
def change
    change_column_default :parents, :pincode, :from => nil, :to => '0000'
end
end
