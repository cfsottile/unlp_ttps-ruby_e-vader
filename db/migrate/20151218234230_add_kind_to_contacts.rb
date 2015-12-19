class AddKindToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :kind, :integer
  end
end
