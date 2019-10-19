class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.integer :thermostat_id
      t.integer :tracking_number
      t.decimal :temperature
      t.decimal :humidity
      t.decimal :battery_charge
      t.timestamps
    end

    add_foreign_key :readings, :thermostats
  end
end
