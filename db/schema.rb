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

ActiveRecord::Schema.define(version: 20160308054029) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.time     "start_time"
    t.date     "end_date"
    t.time     "end_time"
    t.string   "location"
    t.text     "description"
    t.string   "creator_name"
    t.string   "creator_email"
    t.string   "event_organizer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "hotspots", force: :cascade do |t|
    t.string   "issue_type"
    t.string   "location"
    t.datetime "occurred_time"
    t.string   "details"
    t.integer  "report_num"
    t.string   "to_share"
    t.string   "creator_name"
    t.string   "creator_email"
    t.string   "creator_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
