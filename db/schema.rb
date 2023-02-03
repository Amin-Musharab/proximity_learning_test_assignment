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

ActiveRecord::Schema[7.0].define(version: 2023_02_01_135719) do
  create_table "employments", charset: "utf8mb4", force: :cascade do |t|
    t.string "employer"
    t.date "date_started"
    t.date "date_ended"
    t.bigint "personal_datum_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_datum_id"], name: "index_employments_on_personal_datum_id"
  end

  create_table "personal_data", charset: "utf8mb4", force: :cascade do |t|
    t.json "personal_info"
    t.json "address"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employments", "personal_data"
end
