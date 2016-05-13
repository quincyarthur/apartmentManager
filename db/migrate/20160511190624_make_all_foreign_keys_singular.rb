class MakeAllForeignKeysSingular < ActiveRecord::Migration
  def change
    rename_column :properties, :islands_id, :island_id
    rename_column :tenant_rent_details, :tenants_id, :tenant_id
    rename_column :tenant_rent_details, :properties_id, :property_id
    rename_column :property_amenities, :properties_id, :property_id
    rename_column :property_amenities, :amenities_id, :amenity_id
    rename_column :tenant_payment_details, :tenants_id, :tenant_id
  end
end
