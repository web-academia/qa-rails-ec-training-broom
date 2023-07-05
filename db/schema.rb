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

ActiveRecord::Schema.define(version: 2023_07_05_135731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.bigint "shipment_status_id", null: false
    t.integer "order_quantity"
    t.datetime "shipment_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
    t.index ["shipment_status_id"], name: "index_order_details_on_shipment_status_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "order_date"
    t.string "order_number", limit: 16
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_statuses", force: :cascade do |t|
    t.string "product_status_name", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name", limit: 64
    t.bigint "category_id"
    t.integer "price"
    t.string "description", limit: 256
    t.bigint "sale_status_id"
    t.bigint "product_status_id"
    t.datetime "regist_date"
    t.bigint "user_id"
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["product_status_id"], name: "index_products_on_product_status_id"
    t.index ["sale_status_id"], name: "index_products_on_sale_status_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "purchase_price"
    t.integer "purchase_quantity"
    t.string "purchase_company", limit: 128
    t.datetime "order_date"
    t.datetime "purchase_date"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_purchases_on_product_id"
  end

  create_table "sale_statuses", force: :cascade do |t|
    t.string "sale_status_name", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shipment_statuses", force: :cascade do |t|
    t.string "shipment_status_name", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_classfications", force: :cascade do |t|
    t.string "user_classfication_name", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password", limit: 64
    t.string "last_name", limit: 16
    t.string "first_name", limit: 16
    t.string "zipcode", limit: 16
    t.string "prefecture", limit: 16
    t.string "municipality", limit: 16
    t.string "address", limit: 32
    t.string "apartments", limit: 32
    t.string "email", limit: 128
    t.string "phone_number", limit: 16
    t.bigint "user_classfication_id"
    t.string "company_name", limit: 128
    t.boolean "delete_flag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_classfication_id"], name: "index_users_on_user_classfication_id"
  end

  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "order_details", "shipment_statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "product_statuses"
  add_foreign_key "products", "sale_statuses"
  add_foreign_key "products", "users"
  add_foreign_key "purchases", "products"
  add_foreign_key "users", "user_classfications"
end
