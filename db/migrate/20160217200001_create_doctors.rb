class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.decimal :hourly_rate, null: false, precision: 6, scale: 2
      t.integer :hours_per_week, null: false

      t.timestamps null: false
    end
  end
end
