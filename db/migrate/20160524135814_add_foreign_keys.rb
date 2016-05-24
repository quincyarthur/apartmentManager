class AddForeignKeys < ActiveRecord::Migration
  def change
  add_foreign_key :residential_properties, :landlords, index: true
  add_foreign_key :residential_properties, :categories, index: true
  add_foreign_key :residential_properties, :islands, index: true
  add_foreign_key :commercial_properties, :landlords, index: true
  add_foreign_key :commercial_properties, :categories, index: true
  add_foreign_key :commercial_properties, :islands, index: true
  add_foreign_key :tenant_rent_details, :tenants, index: true
  add_foreign_key :landlords, :subscriptions, index: true
  add_foreign_key :tenant_payment_details, :tenants, index: true
  add_index :tenant_rent_details, [:property_id, :property_type]
  add_index :property_amenities, [:property_id, :property_type]
  add_index :prospective_tenants, [:property_id, :property_type]   
  end
end
