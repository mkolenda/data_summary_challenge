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

ActiveRecord::Schema.define(version: 20160502013052) do

  create_table "data_imports", force: :cascade do |t|
    t.decimal  "revenue"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "purchaser_name"
    t.string   "item_description"
    t.decimal  "item_price"
    t.integer  "purchase_count"
    t.string   "merchant_address"
    t.string   "merchant_name"
    t.string   "item_price2"
  end

  create_table "items", force: :cascade do |t|
    t.string   "description"
    t.decimal  "price"
    t.integer  "count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchasers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "count"
    t.integer  "item_id"
    t.integer  "purchaser_id"
    t.integer  "data_import_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "purchases", ["data_import_id"], name: "index_purchases_on_data_import_id"
  add_index "purchases", ["item_id"], name: "index_purchases_on_item_id"
  add_index "purchases", ["purchaser_id"], name: "index_purchases_on_purchaser_id"

end
