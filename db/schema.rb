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

ActiveRecord::Schema.define(version: 20140427193916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "videos", force: true do |t|
    t.string   "name",                        null: false
    t.text     "description",                 null: false
    t.integer  "user_id",                     null: false
    t.boolean  "published",   default: false
    t.string   "youtube_url",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

end
