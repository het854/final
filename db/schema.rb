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

ActiveRecord::Schema.define(version: 0) do

  create_table "bschools", force: true do |t|
    t.string  "name"
    t.integer "country_id", limit: 255
    t.string  "image"
    t.string  "website"
  end

  add_index "bschools", ["country_id"], name: "index_bschools_on_country_id"

  create_table "countries", force: true do |t|
    t.string  "name"
    t.boolean "is_asean", default: false
  end

  create_table "industries", force: true do |t|
    t.string "name"
  end

  create_table "members", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "gender"
    t.integer "bschool_id"
    t.string  "email"
    t.integer "country_id"
    t.integer "year_of_graduation"
    t.integer "SEA_MBA_year_attended"
    t.string  "current_location"
    t.integer "pre_mba_industry_id"
    t.string  "pre_mba_function"
    t.integer "post_mba_industry_id"
    t.string  "post_mba_function"
    t.string  "pre_mba_company"
    t.string  "mba_internship_company"
    t.string  "post_mba_company"
  end

  add_index "members", ["bschool_id"], name: "index_members_on_bschool_id"
  add_index "members", ["country_id"], name: "index_members_on_country_id"
  add_index "members", ["post_mba_industry_id"], name: "index_members_on_post_mba_industry_id"
  add_index "members", ["pre_mba_industry_id"], name: "index_members_on_pre_mba_industry_id"

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
  end

end
