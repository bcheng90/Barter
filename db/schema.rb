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

ActiveRecord::Schema.define(version: 20150416191338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.integer  "timeslot_id"
    t.integer  "student_id"
    t.boolean  "status",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reputations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "judge_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reputations", ["judge_id"], name: "index_reputations_on_judge_id", using: :btree
  add_index "reputations", ["user_id"], name: "index_reputations_on_user_id", using: :btree

  create_table "talents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",       null: false
    t.string   "type",        null: false
    t.string   "sample"
    t.string   "experience",  null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "time"
    t.integer  "user_id"
    t.integer  "offer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 18, null: false
    t.string   "email",                      null: false
    t.string   "location"
    t.string   "interests"
    t.string   "password_digest",            null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
