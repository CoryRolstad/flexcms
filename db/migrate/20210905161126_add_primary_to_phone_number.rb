class AddPrimaryToPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    add_column :phone_numbers, :primary, :boolean
  end
end
