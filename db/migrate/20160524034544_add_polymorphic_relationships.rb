class AddPolymorphicRelationships< ActiveRecord::Migration
  def change
    add_column :tenant_rent_details, :property_type, :string
    add_column :property_amenities, :property_type, :string
  end
end
