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

ActiveRecord::Schema.define(version: 2014_09_21_172258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attached_assets", id: :serial, force: :cascade do |t|
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer "attachable_id"
    t.string "attachable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bdas", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "product_nr_prefix"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "published"
    t.string "product_nr_prefix"
    t.string "background_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer "parent_id"
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.text "title"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachable_type"
    t.integer "attachable_id"
    t.index ["attachable_type", "attachable_id"], name: "index_documents_on_attachable_type_and_attachable_id"
  end

  create_table "news", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "news_body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "news_image_file_name"
    t.string "news_image_content_type"
    t.integer "news_image_file_size"
    t.datetime "news_image_updated_at"
    t.datetime "news_date"
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "product_nr"
    t.text "description"
    t.text "short_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "short_text1"
    t.text "short_text2"
    t.text "technical_data"
    t.boolean "has_ast"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "tdb_file_name"
    t.string "tdb_content_type"
    t.integer "tdb_file_size"
    t.datetime "tdb_updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_token"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
