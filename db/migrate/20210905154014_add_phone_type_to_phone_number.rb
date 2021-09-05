class AddPhoneTypeToPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    add_reference :phone_numbers, :phone_type, foreign_key: true
  end
end
