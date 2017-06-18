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

ActiveRecord::Schema.define(version: 20170618033456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superuser"
    t.string "name"
    t.string "slug"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["name"], name: "index_admin_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_admin_users_on_slug", unique: true
  end

  create_table "admin_users_article_columns", id: false, force: :cascade do |t|
    t.integer "admin_user_id"
    t.integer "column_id"
    t.index ["admin_user_id", "column_id"], name: "index_admin_users_columns_on_user_id_and_column_id", unique: true
    t.index ["admin_user_id"], name: "index_admin_users_article_columns_on_admin_user_id"
    t.index ["column_id"], name: "index_admin_users_article_columns_on_column_id"
  end

  create_table "article_columns", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_article_columns_on_slug", unique: true
  end

  create_table "article_posts", id: :serial, force: :cascade do |t|
    t.string "headline"
    t.string "slug"
    t.string "subhead"
    t.text "body"
    t.datetime "published_at"
    t.boolean "featured", default: false
    t.integer "column_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "featured_image"
    t.index ["author_id"], name: "index_article_posts_on_author_id"
    t.index ["column_id"], name: "index_article_posts_on_column_id"
    t.index ["published_at"], name: "index_article_posts_on_published_at", order: { published_at: :desc }
    t.index ["slug"], name: "index_article_posts_on_slug", unique: true
  end

  create_table "editor_images", id: :serial, force: :cascade do |t|
    t.string "editor_image"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "version_associations", id: :serial, force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

  add_foreign_key "admin_users_article_columns", "admin_users"
  add_foreign_key "admin_users_article_columns", "article_columns", column: "column_id"
  add_foreign_key "article_posts", "admin_users", column: "author_id"
  add_foreign_key "article_posts", "article_columns", column: "column_id"
end
