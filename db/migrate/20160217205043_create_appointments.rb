class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false
      t.references :patient, index: true, foreign_key: true, null: false
      t.datetime :appointment_date, null: false

      t.timestamps null: false
    end
  end
end
