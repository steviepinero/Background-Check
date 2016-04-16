class CreateRecordChecks < ActiveRecord::Migration
  def change
    create_table :record_checks do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.date   :dob

      t.string :approval_code

      t.timestamps null: false
    end
  end
end
