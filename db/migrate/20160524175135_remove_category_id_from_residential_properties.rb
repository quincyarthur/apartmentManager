class RemoveCategoryIdFromResidentialProperties < ActiveRecord::Migration
  def change
    remove_column :residential_properties, :category_id
  end
end
