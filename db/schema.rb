# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160207035030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "address_data", force: :cascade do |t|
    t.string   "city"
    t.string   "street_name"
    t.string   "street_address"
    t.string   "secondary_address"
    t.string   "building_number"
    t.string   "zip"
    t.string   "postcode"
    t.string   "time_zone"
    t.string   "street_suffix"
    t.string   "city_suffix"
    t.string   "city_prefix"
    t.string   "state"
    t.string   "state_abbr"
    t.string   "country"
    t.string   "country_code"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "caves", force: :cascade do |t|
    t.string   "name"
    t.decimal  "latitude",   precision: 9, scale: 6
    t.decimal  "longitude",  precision: 9, scale: 6
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "domain_urls", force: :cascade do |t|
    t.integer  "domain_id"
    t.text     "url"
    t.boolean  "blocked"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "date_and_time_i"
    t.boolean  "valid_url",       default: true
  end

  add_index "domain_urls", ["date_and_time_i"], name: "index_domain_urls_on_date_and_time_i", using: :btree
  add_index "domain_urls", ["url", "domain_id"], name: "index_domain_urls_on_url_and_domain_id", unique: true, using: :btree

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.boolean  "blocked",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "domains", ["name"], name: "index_domains_on_name", unique: true, using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "index"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "web_contents", force: :cascade do |t|
    t.text     "data"
    t.integer  "domain_url_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "text_data"
  end

end
