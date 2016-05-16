class RemoveCountOfInterestedFromProperty < ActiveRecord::Migration
  def change
    remove_column :properties, :amount_of_interest_shown
  end
end
