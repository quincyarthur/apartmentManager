class ChangePropertiesIslandsIdTypetoInt < ActiveRecord::Migration
   def change
     remove_column :properties, :islands_id
     add_column :properties, :islands_id, :integer
 end
end
