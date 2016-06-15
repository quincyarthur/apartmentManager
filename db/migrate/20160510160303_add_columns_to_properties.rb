class AddColumnToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :landlord_id, :integer
    add_column :properties, :category_id, :integer
    add_column :properties, :island, :string
    add_column :properties, :street_name, :string
    add_column :properties, :num_bedrooms, :integer
    add_column :properties, :num_bathrooms, :integer
    add_column :properties, :num_units, :integer
    add_column :properties, :monthly_amt, :integer
    add_column :properties, :description, :string
  end
end
