class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.decimal :money_amount, null:false, precision: 6, scale: 2

      t.timestamps null: false
    end
  end
end
