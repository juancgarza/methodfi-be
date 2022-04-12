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

ActiveRecord::Schema[7.0].define(version: 2022_04_12_002242) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "dba"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string "line_1"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "checking_account_id"
    t.index ["checking_account_id"], name: "index_addresses_on_checking_account_id"
  end

  create_table "branches", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checking_accounts", id: :string, force: :cascade do |t|
    t.string "aba_routing"
    t.string "account_number"
    t.string "ein"
    t.string "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_checking_accounts_on_account_id"
  end

  create_table "employee_destination_accounts", id: :string, force: :cascade do |t|
    t.string "connection_id"
    t.string "account_number"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", id: :string, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "branch_id", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount_cents"
    t.text "description"
    t.string "checking_account_id", null: false
    t.string "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checking_account_id"], name: "index_payments_on_checking_account_id"
    t.index ["receiver_id"], name: "index_payments_on_receiver_id"
  end

  create_table "xml_files", force: :cascade do |t|
    t.text "data"
    t.string "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "checking_accounts"
  add_foreign_key "checking_accounts", "accounts"
  add_foreign_key "payments", "checking_accounts"
end
