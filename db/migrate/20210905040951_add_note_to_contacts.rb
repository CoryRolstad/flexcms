class AddNoteToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :note, :string
  end
end
