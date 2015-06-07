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
    t.string "name"
    t.string "country_id"
  end

  add_index "bschools", ["country_id"], name: "index_bschools_on_country_id"

  create_table "companies", force: true do |t|
    t.string "name"
    t.string "country_id"
    t.string "industry"
  end

  add_index "companies", ["country_id"], name: "index_companies_on_country_id"

  create_table "countries", force: true do |t|
    t.string  "name"
    t.boolean "is_asean", default: false
  end

  create_table "employments", force: true do |t|
    t.string "company_id"
    t.string "function"
    t.string "member_id"
    t.string "period_employed"
  end

  add_index "employments", ["company_id"], name: "index_employments_on_company_id"
  add_index "employments", ["member_id"], name: "index_employments_on_member_id"

# Could not dump table "members" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "users", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
  end

end
