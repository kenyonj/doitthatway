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

ActiveRecord::Schema.define(version: 20140506205521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "video_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree
  add_index "comments", ["video_id"], name: "index_comments_on_video_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id",     null: false
    t.integer  "video_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["video_id"], name: "index_taggings_on_video_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "body",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "taggings_count", default: 0
  end

  create_table "users", force: true do |t|
    t.string   "provider",                         null: false
    t.string   "uid",                              null: false
    t.string   "name",                             null: false
    t.string   "oauth_token",                      null: false
    t.datetime "oauth_expires_at",                 null: false
    t.boolean  "admin",            default: false
    t.boolean  "moderator",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "videos", force: true do |t|
    t.string   "name",                            null: false
    t.text     "description",                     null: false
    t.integer  "user_id",                         null: false
    t.boolean  "published",       default: false
    t.string   "youtube_url",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "upvotes_count",   default: 0
    t.integer  "downvotes_count", default: 0
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

  create_table "votes", force: true do |t|
    t.string   "type",       null: false
    t.integer  "user_id",    null: false
    t.integer  "video_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["video_id"], name: "index_votes_on_video_id", using: :btree

end
