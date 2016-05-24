class AddPolypmorphicToProspectiveTenants < ActiveRecord::Migration
  def change
     add_column :prospective_tenants, :property_type, :string
  end
end
