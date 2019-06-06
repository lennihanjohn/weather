class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.belongs_to(:country, foreign_key: true)
      t.string :name, null: false
      t.float :lat, null: false
      t.float :lon, null: false
      t.timestamps
    end
  end
end
