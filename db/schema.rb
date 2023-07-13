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

ActiveRecord::Schema.define(version: 2023_07_10_121107) do

  create_table "adviser_users", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "adviser_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adviser_id"], name: "index_adviser_users_on_adviser_id"
    t.index ["user_id"], name: "index_adviser_users_on_user_id"
  end

  create_table "advisers", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.string "gender", null: false
    t.string "certification", null: false
    t.text "career", null: false
    t.text "message", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_advisers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_advisers_on_reset_password_token", unique: true
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "ja_name", limit: 10, null: false
    t.string "en_name", limit: 20, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_rooms", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "adviser_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adviser_id"], name: "index_chat_rooms_on_adviser_id"
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "content_categories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "content_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_content_categories_on_category_id"
    t.index ["content_id"], name: "index_content_categories_on_content_id"
  end

  create_table "contents", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "adviser_id", null: false
    t.string "title", limit: 30, null: false
    t.string "image", null: false
    t.string "first_paragraph", limit: 30, null: false
    t.text "first_content", null: false
    t.string "second_paragraph", limit: 30
    t.text "second_content"
    t.string "third_paragraph", limit: 30
    t.text "third_content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adviser_id"], name: "index_contents_on_adviser_id"
  end

  create_table "life_logs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "sleepiness", null: false
    t.integer "feeling", null: false
    t.integer "feces", null: false
    t.text "foods", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_life_logs_on_user_id"
  end

  create_table "messages", charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id"
    t.integer "adviser_id"
    t.bigint "chat_room_id"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "image"
    t.string "gender", null: false
    t.integer "age", null: false
    t.integer "tall"
    t.integer "weight"
    t.text "goal", size: :tiny, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adviser_users", "advisers"
  add_foreign_key "adviser_users", "users"
  add_foreign_key "chat_rooms", "advisers"
  add_foreign_key "chat_rooms", "users"
  add_foreign_key "messages", "chat_rooms"
end
