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

ActiveRecord::Schema.define(version: 20181026003431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dad_jokes", force: :cascade do |t|
    t.string   "question"
    t.string   "answer"
    t.integer  "like_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "prodno"
    t.bigint   "upc"
    t.string   "mf_id"
    t.float    "msrp"
    t.float    "dealer_price"
    t.string   "name"
    t.string   "qty_ut"
    t.integer  "qty_ky"
    t.string   "kit_qty"
    t.float    "weight"
    t.float    "depth"
    t.float    "height"
    t.float    "width"
    t.string   "discontinue"
    t.string   "picture"
    t.string   "brand"
    t.string   "color"
    t.string   "size"
    t.boolean  "ormd"
    t.boolean  "no_export"
    t.boolean  "special_ord"
    t.boolean  "oversize"
    t.text     "note"
    t.float    "rmatv_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "description"
  end

  create_table "inventory_types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.decimal  "unit_price",    precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price",   precision: 12, scale: 3
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "prodno"
    t.string   "name"
    t.string   "size"
    t.string   "vehicle_type"
    t.integer  "vehicle_year"
    t.string   "vehicle_make"
    t.string   "vehicle_model"
    t.string   "color"
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "user_name"
    t.string   "prodno"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.boolean  "text_deals"
    t.string   "email"
    t.boolean  "subscribed"
    t.integer  "shipping_method"
    t.integer  "order_status",                             default: 0
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "type"
    t.integer  "make"
    t.integer  "model"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id", using: :btree
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "vehicles", "users"
end
