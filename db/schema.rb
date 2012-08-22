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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120818221120) do

  create_table "channels", :force => true do |t|
    t.string   "channel"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fliers", :force => true do |t|
    t.string   "title"
    t.string   "tag"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "channel_id"
    t.integer  "community_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "creator_id"
    t.string   "privacy_status"
    t.integer  "added_count"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "org_creator_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",    :limit => 8
    t.integer  "friend_id",  :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "myfliers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "flier_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "attending_status"
    t.integer  "inviter_id"
    t.decimal  "myscore"
  end

  create_table "organization_fliers", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "flier_id"
    t.integer  "attending_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "image"
    t.string   "community_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "fbid"
    t.string   "fname"
    t.string   "lname"
    t.string   "image_url"
    t.string   "oauth_token"
    t.string   "oauth_exp"
    t.integer  "community_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
