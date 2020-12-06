# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_05_035138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.string "state"
    t.string "city"
    t.string "country"
    t.string "zipcode"
    t.geometry "lonlat", limit: {:srid=>0, :type=>"st_point"}
    t.index ["lonlat"], name: "index_properties_on_lonlat", using: :gist
  end

end
