class AddColumnsToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :name, :string
    add_column :landlords, :phone_number, :integer
    add_column :landlords, :subscription_id, :integer
    add_column :landlords, :balance, :integer
    add_column :landlords, :active, :boolean
  end
end
