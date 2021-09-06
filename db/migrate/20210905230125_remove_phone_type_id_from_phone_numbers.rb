class RemovePhoneTypeIdFromPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    remove_column :phone_numbers, :phone_type_id, :int
  end
end
