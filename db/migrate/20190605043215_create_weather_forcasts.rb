class CreateWeatherForcasts < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_forcasts do |t|
      t.references :cities, index: true, foreign_key: true
      t.references :weather_descriptions, index: true, foreign_key: true
      t.integer :temperature
      t.integer :min_temperature
      t.integer :max_temperature
      t.integer :humidity
      t.integer :pressure
      t.time :sunrise
      t.time :sunset
      t.timestamps
    end
  end
end
