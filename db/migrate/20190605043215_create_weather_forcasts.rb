class CreateWeatherForcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_forcasts do |t|
      t.references(:city, foreign_key: true)
      t.references(:weather_description, foreign_key: true)
      t.integer :temperature, null: false
      t.integer :min_temperature, null: false
      t.integer :max_temperature, null: false
      t.integer :humidity, null: false
      t.integer :pressure, null: false
      t.time :sunrise, null: false
      t.time :sunset, null: false
      t.timestamps
    end
  end
end
