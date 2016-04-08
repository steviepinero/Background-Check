class CreateRecordChecks < ActiveRecord::Migration
  def change
    create_table :record_checks do |t|
      t.string :firstName
      t.string :middleName
      t.string :lastName
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :DOB
      t.integer :ageMin
      t.integer :ageMax
      t.integer :limit
      t.string :exactMatch

      t.timestamps null: false
    end
  end
end
