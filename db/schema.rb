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

ActiveRecord::Schema.define(version: 2020_03_30_220545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.string "period_posted"
    t.string "account_name"
    t.float "net"
    t.integer "invoice_number"
    t.integer "unit_id"
    t.integer "vendor_id"
  end

  create_table "leases", force: :cascade do |t|
    t.integer "unit_id"
    t.date "lease_start"
    t.date "lease_end"
    t.string "bedrooms"
    t.string "unit_classification"
    t.boolean "third_party_unit"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "reservation_number"
    t.string "parent_name"
    t.date "arrival"
    t.date "departure"
    t.integer "unit_id"
    t.string "master_sub_unit"
    t.string "nch_3p"
    t.string "bedrooms"
  end

end
