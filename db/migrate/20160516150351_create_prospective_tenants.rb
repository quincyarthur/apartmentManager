class CreateProspectiveTenants < ActiveRecord::Migration
  def change
    create_table :prospective_tenants do |t|
      t.integer :property_id
      t.string :name
      t.string :phone_number
      t.date :appointment_date

      t.timestamps null: false
    end
  end
end
