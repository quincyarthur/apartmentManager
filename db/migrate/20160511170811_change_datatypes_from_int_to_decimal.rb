class ChangeDatatypesFromIntToDecimal < ActiveRecord::Migration
  def up
    change_column :tenants, :balance, :decimal
    change_column :landlords, :balance, :decimal
    change_column :subscriptions, :amount, :decimal
    change_column :tenant_payment_details, :payment_amount, :decimal
    change_column :properties, :monthly_amt, :decimal
  end
  
  def down
     change_column :tenants, :balance, :integer
     change_column :landlords, :balance, :integer
     change_column :subscriptions, :amount, :integer
     change_column :tenant_payment_details, :payment_amount, :integer
     change_column :properties, :monthly_amt, :integer
  end
end
