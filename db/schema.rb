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

ActiveRecord::Schema.define(version: 20150206172617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "suffix"
    t.string "catch_phrase"
    t.string "email"
    t.date   "start_date"
    t.string "industry"
  end

  create_table "locations", force: :cascade do |t|
    t.string  "city"
    t.string  "street_name"
    t.string  "state"
    t.integer "zip_code"
    t.string  "country"
    t.integer "company_id"
  end

  create_table "products", force: :cascade do |t|
    t.string  "department"
    t.string  "name"
    t.float   "price"
    t.integer "company_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.integer "product_id"
    t.integer "rating"
  end

end
