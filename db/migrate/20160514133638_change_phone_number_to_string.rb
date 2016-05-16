class ChangePhoneNumberToString < ActiveRecord::Migration
  def change
    change_column :tenants, :phone_number, :string
    change_column :landlords, :phone_number, :string
  end
end
