# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_15_190906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "temperatures", force: :cascade do |t|
    t.decimal "value", precision: 10, scale: 1
    t.integer "unix_fixed_at"
    t.datetime "fixed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fixed_at"], name: "index_temperatures_on_fixed_at", unique: true
  end

end
