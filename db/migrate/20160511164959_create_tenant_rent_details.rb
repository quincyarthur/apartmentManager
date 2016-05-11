class CreateTenantRentDetails < ActiveRecord::Migration
  def change
    create_table :tenant_rent_details do |t|
      t.integer :tenants_id
      t.integer :properties_id
      t.date :rent_due_date
      t.date :lease_start_date
      t.date :lease_end_date

      t.timestamps null: false
    end
  end
end
