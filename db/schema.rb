# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_13_003738) do

  create_table "collection_submissions", force: :cascade do |t|
    t.integer "collection_id", null: false
    t.integer "submission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_collection_submissions_on_collection_id"
    t.index ["submission_id"], name: "index_collection_submissions_on_submission_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "notes"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "upvoted_submissions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "submission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["submission_id"], name: "index_upvoted_submissions_on_submission_id"
    t.index ["user_id"], name: "index_upvoted_submissions_on_user_id"
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "submission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["submission_id"], name: "index_upvotes_on_submission_id"
    t.index ["user_id"], name: "index_upvotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "from_omniauth"
  end

  add_foreign_key "collection_submissions", "collections"
  add_foreign_key "collection_submissions", "submissions"
  add_foreign_key "collections", "users"
  add_foreign_key "submissions", "users"
  add_foreign_key "upvoted_submissions", "submissions"
  add_foreign_key "upvoted_submissions", "users"
  add_foreign_key "upvotes", "submissions"
  add_foreign_key "upvotes", "users"
end
