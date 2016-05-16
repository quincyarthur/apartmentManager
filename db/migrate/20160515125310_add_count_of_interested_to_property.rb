class AddCountOfInterestedToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :amount_of_interest_shown, :integer
  end
end
