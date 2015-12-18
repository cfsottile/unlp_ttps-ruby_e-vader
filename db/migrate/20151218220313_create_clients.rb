class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, limit: 50, null: false
      t.string :last_name, limit: 50, null: false
      t.string :document_number, limit: 10, null: false
      t.integer :gender, null: false
      t.date :birthday, null: false
      t.string :cuilt, limit: 15, null: false

      t.timestamps null: false
    end
  end
end
