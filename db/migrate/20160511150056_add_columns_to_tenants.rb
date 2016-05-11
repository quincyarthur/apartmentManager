class AddColumnsToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :first_name, :string
    add_column :tenants, :last_name, :string 
    add_column :tenants, :phone_number, :int 
    add_column :tenants, :balance, :int
  end
end
