class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :client, index: true, foreign_key: true, null: false
      t.references :person, index: true, foreign_key: true, null: false
      t.string :description, limit: 255, null: false
      t.decimal :amount, null: false, precision: 12, scale: 2
      t.date :emission_date, null: false

      t.timestamps null: false
    end
  end
end
