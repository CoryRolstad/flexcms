class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.references :contact, foreign_key: true
      t.string :number
      t.string :description

      t.timestamps
    end
  end
end
