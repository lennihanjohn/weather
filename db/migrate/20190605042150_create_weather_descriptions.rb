class CreateWeatherDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_descriptions do |t|
      t.string :main, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
