class CreateWeatherDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_descriptions do |t|
      t.string :description
      t.timestamps
    end
  end
end
