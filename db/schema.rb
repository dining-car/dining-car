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

ActiveRecord::Schema.define(version: 2018_10_30_175240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.string "domain"
    t.string "display_name"
    t.string "note"
    t.string "uri"
    t.string "url"
    t.datetime "last_webfingered_at"
    t.string "inbox_url"
    t.string "outbox_url"
    t.string "shared_inbox_url"
    t.string "followers_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((username)::text), lower((domain)::text)", name: "index_accounts_on_username_and_domain_lower", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_groups", force: :cascade do |t|
    t.string "title"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredient_groups_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "title"
    t.bigint "ingredient_group_id"
    t.string "quantity"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_group_id"], name: "index_ingredients_on_ingredient_group_id"
    t.index ["unit_id"], name: "index_ingredients_on_unit_id"
  end

  create_table "instruction_groups", force: :cascade do |t|
    t.string "title"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "instructions"
    t.index ["recipe_id"], name: "index_instruction_groups_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "info"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.bigint "cuisine_id"
    t.integer "preparation_time"
    t.integer "cooking_time"
    t.integer "servings"
    t.string "source", array: true
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_recipes_on_account_id"
    t.index ["course_id"], name: "index_recipes_on_course_id"
    t.index ["cuisine_id"], name: "index_recipes_on_cuisine_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id", null: false
    t.boolean "admin", default: false, null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ingredient_groups", "recipes"
  add_foreign_key "ingredients", "ingredient_groups"
  add_foreign_key "ingredients", "units"
  add_foreign_key "instruction_groups", "recipes"
  add_foreign_key "recipes", "accounts"
  add_foreign_key "recipes", "courses"
  add_foreign_key "recipes", "cuisines"
  add_foreign_key "users", "accounts"
end
