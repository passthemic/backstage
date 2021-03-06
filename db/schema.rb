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

ActiveRecord::Schema.define(:version => 20130530205023) do

  create_table "raps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "final_cut_file_name"
    t.string   "final_cut_content_type"
    t.integer  "final_cut_file_size"
    t.datetime "final_cut_updated_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "raps", ["friend_id"], :name => "index_raps_on_friend_id"
  add_index "raps", ["user_id"], :name => "index_raps_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "username",               :default => "", :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "verses", :force => true do |t|
    t.integer  "rap_id"
    t.integer  "user_id"
    t.string   "vocal_track_file_name"
    t.string   "vocal_track_content_type"
    t.integer  "vocal_track_file_size"
    t.datetime "vocal_track_updated_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "verses", ["rap_id"], :name => "index_verses_on_rap_id"
  add_index "verses", ["user_id"], :name => "index_verses_on_user_id"

end
