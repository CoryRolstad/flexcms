class RemoveDescriptionFromPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    remove_column :phone_numbers, :description, :string
  end
end
