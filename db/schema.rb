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

ActiveRecord::Schema[7.0].define(version: 2023_02_28_100231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hitmen", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "method"
    t.text "bio"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_hitmen_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.text "details"
    t.date "deadline"
    t.string "location"
    t.boolean "completed", default: false
    t.decimal "price"
    t.boolean "accepted", default: false
    t.boolean "paid", default: false
    t.decimal "rating"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "hitman_id", null: false
    t.index ["hitman_id"], name: "index_jobs_on_hitman_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_id", null: false
    t.bigint "user_id", null: false
    t.index ["job_id"], name: "index_messages_on_job_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hitmen", "users"
  add_foreign_key "jobs", "hitmen"
  add_foreign_key "jobs", "users"
  add_foreign_key "messages", "jobs"
  add_foreign_key "messages", "users"
end
