class ChangePropertiesToUseIslandId < ActiveRecord::Migration
  def change
    rename_column :properties, :island, :islands_id
  end
end
