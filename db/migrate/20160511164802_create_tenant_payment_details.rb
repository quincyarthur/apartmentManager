class CreateTenantPaymentDetails < ActiveRecord::Migration
  def change
    create_table :tenant_payment_details do |t|
      t.integer :tenants_id
      t.integer :payment_amount

      t.timestamps null: false
    end
  end
end
