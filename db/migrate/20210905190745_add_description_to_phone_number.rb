class AddDescriptionToPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    add_column :phone_numbers, :description, :string
  end
end
