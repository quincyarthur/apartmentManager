class AddColumnsToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :first_name, :string
    add_column :tenants, :last_name, :string 
    add_column :tenants, :phone_number, :integer 
    add_column :tenants, :balance, :integer
  end
end
