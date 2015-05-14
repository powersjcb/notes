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

ActiveRecord::Schema.define(version: 20150513235438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_rental_requests", force: true do |t|
    t.integer  "cat_id",                 null: false
    t.date     "end_date",               null: false
    t.date     "start_date",             null: false
    t.string   "status",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    default: 1, null: false
  end

  add_index "cat_rental_requests", ["cat_id"], name: "index_cat_rental_requests_on_cat_id", using: :btree
  add_index "cat_rental_requests", ["user_id"], name: "index_cat_rental_requests_on_user_id", using: :btree

  create_table "cats", force: true do |t|
    t.date     "birth_date",            null: false
    t.string   "color",                 null: false
    t.string   "name",                  null: false
    t.string   "sex",         limit: 1, null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",               null: false
  end

  add_index "cats", ["user_id"], name: "index_cats_on_user_id", using: :btree

  create_table "user_sessions", force: true do |t|
    t.string   "session_token", null: false
    t.integer  "user_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sessions", ["session_token"], name: "index_user_sessions_on_session_token", unique: true, using: :btree
  add_index "user_sessions", ["user_id"], name: "index_user_sessions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "user_name",       null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree

end
