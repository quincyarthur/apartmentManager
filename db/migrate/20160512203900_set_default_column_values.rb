class SetDefaultColumnValues < ActiveRecord::Migration
  def change
    change_column :landlords, :balance, :decimal, default: 0.00
    change_column :landlords, :active, :boolean, default:  true
    change_column :tenants, :balance, :decimal, default: 0.00
  end
end
