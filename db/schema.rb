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

ActiveRecord::Schema.define(version: 20140108221833) do

  create_table "mentions", force: true do |t|
    t.string   "hash_id"
    t.string   "username"
    t.float    "klout"
    t.string   "message"
    t.datetime "tweet_timestamp"
    t.boolean  "flag"
    t.boolean  "should_respond"
    t.boolean  "responded"
    t.boolean  "archived"
    t.boolean  "favorited"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mentions", ["archived"], name: "index_mentions_on_archived"
  add_index "mentions", ["hash_id"], name: "index_mentions_on_hash_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "location"
    t.string   "nickname"
  end

end
