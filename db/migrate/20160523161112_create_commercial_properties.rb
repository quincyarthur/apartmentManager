class CreateCommercialProperties < ActiveRecord::Migration
  def change
    create_table :commercial_properties do |t|
      t.integer :landlord_id
      t.integer :category_id
      t.integer :island_id
      t.string :street_name
      t.integer :square_feet
      t.decimal :num_bathrooms
      t.integer :num_units
      t.decimal :monthly_amt
      t.string :description

      t.timestamps null: false
    end
  end
end
