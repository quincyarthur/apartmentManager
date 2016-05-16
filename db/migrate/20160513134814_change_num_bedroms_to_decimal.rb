class ChangeNumBedromsToDecimal < ActiveRecord::Migration
  def change
    change_column :properties, :num_bathrooms, :decimal
  end
end
