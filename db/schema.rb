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

ActiveRecord::Schema.define(version: 20140314184216) do

  create_table "grants", force: true do |t|
    t.integer "donor_id"
    t.integer "recipient_id"
    t.integer "year_authorized"
    t.float   "grant_amount"
    t.string  "support_type"
    t.string  "description"
  end

  create_table "orgs", force: true do |t|
    t.string "group"
    t.string "name"
    t.string "state"
    t.string "city"
  end

  add_index "orgs", ["name"], name: "index_orgs_on_name", unique: true

end
