class AddColumnsToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :name, :string
    add_column :landlords, :phone_number, :int
    add_column :landlords, :subscription_id, :int
    add_column :landlords, :balance, :int
    add_column :landlords, :active, :boolean
  end
end
