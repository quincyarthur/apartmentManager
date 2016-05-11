class AddColumnToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :landlord_id, :int
    add_column :properties, :category_id, :int
    add_column :properties, :island, :string
    add_column :properties, :street_name, :string
    add_column :properties, :num_bedrooms, :int
    add_column :properties, :num_bathrooms, :int
    add_column :properties, :num_units, :int
    add_column :properties, :monthly_amt, :int
    add_column :properties, :description, :string
  end
end
