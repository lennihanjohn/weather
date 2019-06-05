class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.references :countries, index: true, foreign_key: true
      t.string :name
      t.float :lat
      t.float :lon
      t.timestamps
    end
  end
end
