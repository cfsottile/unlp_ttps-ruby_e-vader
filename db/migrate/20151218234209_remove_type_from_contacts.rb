class RemoveTypeFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :type, :integer
  end
end
