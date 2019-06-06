# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_05_043215) do

  create_table "cities", force: :cascade do |t|
    t.integer "country_id"
    t.string "name", null: false
    t.float "lat", null: false
    t.float "lon", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weather_descriptions", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weather_forcasts", force: :cascade do |t|
    t.integer "city_id"
    t.integer "weather_description_id"
    t.integer "temperature", null: false
    t.integer "min_temperature", null: false
    t.integer "max_temperature", null: false
    t.integer "humidity", null: false
    t.integer "pressure", null: false
    t.time "sunrise", null: false
    t.time "sunset", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_weather_forcasts_on_city_id"
    t.index ["weather_description_id"], name: "index_weather_forcasts_on_weather_description_id"
  end

end
