class RenamePropertiesToResidentialProperties < ActiveRecord::Migration
  def change
    rename_table :properties, :residential_properties
  end
end
