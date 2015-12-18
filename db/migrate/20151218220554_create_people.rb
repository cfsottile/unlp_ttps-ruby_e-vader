class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, limit: 50, null: false
      t.string :cuilt, limit: 15, null: false

      t.timestamps null: false
    end
  end
end
