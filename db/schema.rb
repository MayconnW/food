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

ActiveRecord::Schema.define(version: 20161102160644) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "state_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "configurations", force: :cascade do |t|
    t.integer  "number_of_tables", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "email",              limit: 255
    t.string   "mobile",             limit: 255
    t.string   "phone",              limit: 255
    t.string   "address",            limit: 255
    t.string   "number",             limit: 255
    t.integer  "city_id",            limit: 4
    t.integer  "state_id",           limit: 4
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "customers", ["city_id"], name: "index_customers_on_city_id", using: :btree
  add_index "customers", ["state_id"], name: "index_customers_on_state_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.integer  "sale_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "quantity",   limit: 4
    t.boolean  "to_go"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "items", ["product_id"], name: "index_items_on_product_id", using: :btree
  add_index "items", ["sale_id"], name: "index_items_on_sale_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "category_id",        limit: 4
    t.string   "name",               limit: 255
    t.float    "price",              limit: 24
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "rich_rich_files", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name",    limit: 255
    t.string   "rich_file_content_type", limit: 255
    t.integer  "rich_file_file_size",    limit: 4
    t.datetime "rich_file_updated_at"
    t.string   "owner_type",             limit: 255
    t.integer  "owner_id",               limit: 4
    t.text     "uri_cache",              limit: 65535
    t.string   "simplified_type",        limit: 255,   default: "file"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "table",       limit: 4
    t.integer  "customer_id", limit: 4
    t.integer  "waiter_id",   limit: 4
    t.integer  "status",      limit: 4
    t.float    "total",       limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sales", ["customer_id"], name: "index_sales_on_customer_id", using: :btree
  add_index "sales", ["waiter_id"], name: "index_sales_on_waiter_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "initials",   limit: 255
    t.string   "name",       limit: 255
    t.integer  "capital_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "states", ["capital_id"], name: "index_states_on_capital_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "photo_file_name",        limit: 255
    t.string   "photo_content_type",     limit: 255
    t.integer  "photo_file_size",        limit: 4
    t.datetime "photo_updated_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "waiters", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "cities", "states"
  add_foreign_key "customers", "cities"
  add_foreign_key "customers", "states"
  add_foreign_key "items", "products"
  add_foreign_key "items", "sales"
  add_foreign_key "products", "categories"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "waiters"
  add_foreign_key "users", "roles"
end
