class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :client, index: true, foreign_key: true, null: false
      t.integer :type, null: false
      t.string :value, limit: 255, null: false

      t.timestamps null: false
    end
  end
end
