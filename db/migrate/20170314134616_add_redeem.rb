class AddRedeem < ActiveRecord::Migration[5.0]
  def change
    add_column(:rewards, :redeemed, :boolean, :default => false)
  end
end
