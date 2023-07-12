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

ActiveRecord::Schema[7.0].define(version: 2023_07_12_140600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment", id: :serial, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "post_id", null: false
    t.text "text", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "likes", id: :serial, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "post", id: :serial, force: :cascade do |t|
    t.integer "author_id", null: false
    t.string "title", limit: 255, null: false
    t.text "text", null: false
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.string "name"
    t.string "photo"
    t.text "bio"
    t.integer "posts_counter"
  end

  add_foreign_key "comment", "post", name: "comment_post_id_fkey"
  add_foreign_key "comment", "users", column: "author_id", name: "comment_author_id_fkey"
  add_foreign_key "likes", "post", name: "likes_post_id_fkey"
  add_foreign_key "likes", "users", column: "author_id", name: "likes_author_id_fkey"
  add_foreign_key "post", "users", column: "author_id", name: "post_author_id_fkey"
end
