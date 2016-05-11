class CreatePropertyAmenities < ActiveRecord::Migration
  def change
    create_table :property_amenities do |t|
      t.integer :properties_id
      t.integer :amenities_id

      t.timestamps null: false
    end
  end
end
