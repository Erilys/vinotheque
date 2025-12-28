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

ActiveRecord::Schema[8.1].define(version: 2025_12_28_204556) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "drinks", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.bigint "event_id"
    t.bigint "location_id"
    t.integer "note"
    t.integer "quantity", default: 1, null: false
    t.datetime "updated_at", null: false
    t.bigint "wine_id", null: false
    t.index ["event_id"], name: "index_drinks_on_event_id"
    t.index ["location_id"], name: "index_drinks_on_location_id"
    t.index ["wine_id"], name: "index_drinks_on_wine_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.date "end_date"
    t.string "name"
    t.date "start_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locations_on_name", unique: true
  end

  create_table "operations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "location_id"
    t.integer "quantity"
    t.bigint "source_id"
    t.string "source_type"
    t.datetime "updated_at", null: false
    t.bigint "wine_id", null: false
    t.index ["location_id"], name: "index_operations_on_location_id"
    t.index ["source_id"], name: "index_operations_on_source_id"
    t.index ["wine_id"], name: "index_operations_on_wine_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.boolean "gift", default: false, null: false
    t.integer "price_per_bottle_in_cents", default: 0
    t.date "purchase_date", default: -> { "CURRENT_TIMESTAMP" }
    t.string "store"
    t.string "town"
    t.datetime "updated_at", null: false
    t.bigint "wine_id", null: false
    t.index ["wine_id"], name: "index_purchases_on_wine_id"
  end

  create_table "wines", force: :cascade do |t|
    t.string "aged"
    t.string "bottling"
    t.integer "color", default: 0, null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.boolean "organic"
    t.string "ticket"
    t.float "titration"
    t.datetime "updated_at", null: false
    t.string "variety"
    t.integer "volume"
    t.string "xl_id"
    t.integer "year"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"

  create_view "stocks", materialized: true, sql_definition: <<-SQL
      WITH inventory AS (
           SELECT operations.wine_id,
              sum(operations.quantity) AS quantity,
              operations.location_id
             FROM operations
            GROUP BY operations.wine_id, operations.location_id
          UNION
           SELECT drinks.wine_id,
              sum((drinks.quantity * '-1'::integer)) AS quantity,
              drinks.location_id
             FROM drinks
            GROUP BY drinks.wine_id, drinks.location_id
          ), temp_table AS (
           SELECT inventory.wine_id,
              sum(inventory.quantity) AS quantity,
              inventory.location_id
             FROM inventory
            GROUP BY inventory.wine_id, inventory.location_id
          )
   SELECT temp_table.wine_id,
      temp_table.quantity,
      temp_table.location_id
     FROM temp_table
    WHERE (temp_table.quantity <> (0)::numeric);
  SQL
  add_index "stocks", ["wine_id"], name: "index_stocks_on_wine_id"

end
