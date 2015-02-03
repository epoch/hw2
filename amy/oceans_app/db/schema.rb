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

ActiveRecord::Schema.define(version: 20150203130420) do

  create_table "mountains", force: :cascade do |t|
    t.text     "name"
    t.integer  "height"
    t.text     "country"
    t.text     "nearest_ocean"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oceans", force: :cascade do |t|
    t.string   "name"
    t.text     "image"
    t.integer  "average_depth"
    t.integer  "deepest_point"
    t.integer  "area"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
